#!/usr/bin/env python3
"""Extract one full-resolution PNG per scanned PDF page; source stays local."""
from pathlib import Path
from concurrent.futures import ThreadPoolExecutor
from tempfile import TemporaryDirectory
import argparse,subprocess,os
def main():
    p=argparse.ArgumentParser()
    p.add_argument('pdf',type=Path)
    p.add_argument('--dest',type=Path,default=Path(__file__).resolve().parent/'pages')
    p.add_argument('--jobs',type=int,default=4)
    args=p.parse_args()
    args.dest.mkdir(parents=True,exist_ok=True)
    info=subprocess.run(['pdfinfo',str(args.pdf)],check=True,capture_output=True,text=True).stdout
    total=int(next(s.split(':',1)[1].strip() for s in info.splitlines() if s.startswith('Pages:')))
    if total!=445:raise RuntimeError(f'Expected 445 pages, found {total}')
    missing=[i for i in range(total) if not (args.dest/f'page-{i:03d}.png').is_file()]
    chunks=[]
    for i in missing:
        if not chunks or len(chunks[-1])>=25 or i!=chunks[-1][-1]+1:chunks.append([i])
        else:chunks[-1].append(i)
    def extract(part):
        with TemporaryDirectory(prefix='typst-pages-') as tmp:
            prefix=Path(tmp)/'image'
            subprocess.run(['pdfimages','-f',str(part[0]+1),'-l',str(part[-1]+1),
                '-png',str(args.pdf),str(prefix)],check=True)
            images=sorted(Path(tmp).glob('image-*.png'))
            if len(images)!=len(part):raise RuntimeError('Unexpected number of page images')
            for file,index in zip(images,part):os.replace(file,args.dest/f'page-{index:03d}.png')
    with ThreadPoolExecutor(max_workers=args.jobs) as workers:list(workers.map(extract,chunks))
    if len(list(args.dest.glob('page-*.png')))!=445:raise RuntimeError('Incomplete extraction')
    print('445 pages extracted')
if __name__=='__main__':main()
