#!/bin/bash

watch() {
  while inotifywait -r -e modify,create,delete,move /mnt/; 
  do rsync --delete -av /mnt/$1/ /usr/src/app/invoice/; 
  done
}

watch

# python -m SimpleHTTPServer 8000 &

# npm run-script devServer