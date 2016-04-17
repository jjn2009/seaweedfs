for i in `seq 1 $1`; do
  output=`docker run --rm --net=sw appropriate/curl -X POST http://swmaster:9333/dir/assign?replication=001 2> /dev/null`
  echo $output
  command="console.log(JSON.parse('$output').url + '/' + JSON.parse('$output').fid)"
  volurl=`echo $command | node`
  docker run --rm -v `pwd`/testfile:/testfile --net=sw appropriate/curl -F file=@/testfile -X POST $volurl 2> /dev/null
  echo "\n"
  echo $volurl >> filelist
done
