while read f; do
  echo $f
  docker run --rm --net=sw appropriate/curl $f 2> /dev/null
done  < filelist
