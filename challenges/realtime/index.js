var http = require('http');
var NRP = require('node-redis-pubsub');
var redisConfig = { port: 6379, scope: 'realtime-api' }

var getQueryFromRequest = function(req) {
  var query = {};
  var wholeQuery = req.url.split('?')[1];
  if (wholeQuery) {
    var queryParts = wholeQuery.split('&');
    for (var i = 0; i < queryParts.length; i++) {
      var key = queryParts[i].split('=')[0];
      var value = queryParts[i].split('=')[1];
      query[key] = value;
    }
  }
  return query;
}

var emitSensorEvent = function(data) {
  var nrp = new NRP(redisConfig);
  nrp.emit('sensor.' + data.id, {id: data.id, value: data.value});
}


http.createServer(function (req, res) {
  var url = req.url.split('?')[0];
  var query = getQueryFromRequest(req);

  if (url.match(/^\/sensor-data\/?$/)) {
    if (req.method === 'GET') {
      res.writeHead(200, {'Content-Type': 'text/plain'});

      var sensorChannel = 'sensor.*';
      if ((typeof query.sensor) === 'string' && !query.sensor.match(/^\s*$/)) {
        sensorChannel = 'sensor.' + query.sensor;
      }

      var nrp = new NRP(redisConfig);

      nrp.on(sensorChannel, function (data) {
        res.write('' + data.id + '=' + data.value.toString() + "\n");
      });

      res.on('close', function() {
        nrp.off(sensorChannel);
      });
    } else if (req.method === 'POST') {
      req.on('data', function (data) {
        data = JSON.parse(data);

        emitSensorEvent(data)

        res.writeHead(201, {'Content-Type': 'application/json'});
        res.end('{"status": "data collected"}');
      });
    } else {
      res.writeHead(405, {'Content-Type': 'application/json'});
      res.end('{"error": "Method not allowed"}');
    }
  } else {
    res.writeHead(404, {'Content-Type': 'application/json'});
    res.end('{"error": "Not found"}');
  }
}).listen(9292);
