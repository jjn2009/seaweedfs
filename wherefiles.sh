volIds=`echo "f=require('fs').readFileSync('filelist').toString().trim().split('\\\\\\n');for(i in f){console.log(f[i].split('/')[1].split(',')[0])}" | node`
while read volId; do
  echo volId $volId
  docker run --rm --net=sw appropriate/curl -X POST http://swmaster:9333/dir/lookup?volumeId=$volId 2> /dev/null
done <<< "$volIds"
