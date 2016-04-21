var request = require('request');

var replication = process.argv[2];
console.log('replication', replication);

request('http://192.168.64.2:9333/vol/status', function(err, response, body) {
  body = JSON.parse(body);
  var vols = body.Volumes;

  var volStats = {};

  for(datacenterName in vols.DataCenters) {
    var dc = vols.DataCenters[datacenterName];

    for(rackName in dc) {
      var rack = dc[rackName];

      for(nodeName in rack) {
        var node = rack[nodeName];


        for(volName in node) {
          var id = node[volName].Id;
          if(!volStats[id])
            volStats[id] = {nodes:[],racks:[],datacenters:[]};

          if(volStats[id].nodes.indexOf(nodeName) == -1)
            volStats[id].nodes.push(nodeName);
          if(volStats[id].racks.indexOf(rackName) == -1)
            volStats[id].racks.push(rackName)
          if(volStats[id].datacenters.indexOf(datacenterName) == -1)
            volStats[id].datacenters.push(datacenterName)

        }
      }
    }
  }

  console.log(JSON.stringify(volStats, null, 2));
});
