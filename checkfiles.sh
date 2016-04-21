while read f; do
  echo $f
  docker run --rm --net=sw appropriate/curl -I $f 2> /dev/null | grep HTTP
  exit
done  < filelist
