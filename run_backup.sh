docker run -v `pwd`/backup:/data -p 9090:8080 -d --name backup-vol --net=sw \
  seaweed volume -mserver="swmaster:9333" -ip backup-vol -dir=/data/ -publicUrl=192.168.64.2:9090 -port.public=9090
