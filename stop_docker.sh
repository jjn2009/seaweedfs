docker rm -f swmaster

for i in `seq 1 $1`; do
  docker rm -f vol$i
done
rm filelist
