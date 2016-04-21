echo docker run --rm -v `pwd`/backup:/data --net=sw seaweed backup -server=swmaster:9333 -dir=/data -volumeId=$1
docker run --rm -v `pwd`/backup:/data --net=sw seaweed backup -server=swmaster:9333 -dir=/data -volumeId=$1
