
docker run -d -p 8080:8080 -p 9333:9333 --name swmaster --net=sw \
  seaweed master -defaultReplication=111 -ip=swmaster

p=0
for j in "dc1" "dc2"; do
  for k in "rack1" "rack2"; do
    for i in `seq 1 $1`; do
      p=$((1 + p))
      publicPort=$((p + 8090))
    
      node=vol-$j-$k-$i
      echo $node

      docker run -p $publicPort:8080 -d --name $node --net=sw \
        seaweed volume -mserver="swmaster:9333" -dataCenter=$j -rack=$k -ip $node -dir=/data/ -publicUrl=192.168.64.2:$publicPort -port.public=$publicPort 2> /dev/null
    done
  done
done


