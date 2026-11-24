#!/usr/bin/env bash
# Keep CI compiling when GitHub release archives temporarily return 5xx.
# Fallback uses the official Typst OCI image, not an unverified mirror.
set -euo pipefail
version="${1:?usage: ensure-typst.sh VERSION}"
if command -v typst >/dev/null 2>&1 && typst --version | grep -Fq "typst ${version}"; then
  echo "Typst ${version} already available."
  exit 0
fi
echo "::warning::Typst release download unavailable; trying official ghcr.io/typst/typst:${version}"
image="ghcr.io/typst/typst:${version}"
pulled=0
for attempt in 1 2 3; do
  if timeout 90s docker pull "${image}"; then
    pulled=1
    break
  fi
  echo "::warning::OCI fallback pull attempt ${attempt}/3 failed"
  sleep 5
done
if (( pulled != 1 )); then
  echo "::error::Unable to obtain the Typst compiler from GitHub releases or GHCR"
  exit 1
fi
cid="$(docker create "${image}" --version)"
trap 'docker rm -f "$cid" >/dev/null 2>&1 || true' EXIT
docker cp "${cid}:/bin/typst" "${RUNNER_TEMP}/typst"
chmod 755 "${RUNNER_TEMP}/typst"
"${RUNNER_TEMP}/typst" --version | grep -F "typst ${version}"
echo "${RUNNER_TEMP}" >> "${GITHUB_PATH}"
