docker run -d -p 8080:8080 -p 9333:9333 --name swmaster --net=sw seaweed master -defaultReplication="001"

for i in `seq 1 $1`; do
  docker run -d --name vol$i --net=sw seaweed volume -mserver="swmaster:9333" -ip vol$i
done
