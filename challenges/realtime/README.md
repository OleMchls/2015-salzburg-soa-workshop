# Realtime Example

This is an example of a realtime API written in node that is backed by [Redis Pub/Sub](http://redis.io/topics/pubsub).

The API is very rough, doesn't check for any errors and consists of just two endpoints:

**POST** to ``/sensor-data`` with a JSON body with the following payload: ``{"id": "some-id", "value": "some-value"}``.

**GET** to ``/sensor-data``

The idea is that the POST request sends some value from a sensor to the backend which then broadcasts this in real time to all connected clients.

Clients connect by requesting the GET endpoint. The server keeps the connection to the clients open!

Each sensor value that is posted will be send to all clients as: ``id=value\n``. So your clients can break messages on new-lines ``\n``.

Clients can use a ``?sensor=some-filter`` query parameter when requesting the GET endpoint. The ``some-filter`` value basically matches on the sensor id's send to in POST request as ``id``.

### Real world example:

Run the server:

```sh
nodejs index.js
```

Connect a client that listens to all humidity sensor data:

```sh
curl 'http://localhost:9292/sensor-data?sensor=humidity.*'
```

Connect a client that listens to all sensor data:

```sh
curl 'http://localhost:9292/sensor-data'
```

Connect a client that listens to data from all sensors in Salzburg:

```sh
curl 'http://localhost:9292/sensor-data?sensor=*.salzburg.*'
```

Send data from a temperature sensor in Salzburg:

```sh
curl -d '{"id": "temperature.salzburg.1234", "value": "8.4"}' http://localhost:9292/sensor-data
```
