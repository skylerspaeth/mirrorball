var 

    // Constants
    SERVER_PORT = 3000,

    // Module imports
    express = require('express'),
    exec = require('child_process').exec,

    // Create a webserver.
    app = express(),

    // Create status variable
    status = null
;

// Attach the URL root (e.g. http://10.0.1.15/) to our www directory.
//app.use('/media', express.static(__dirname + '/media'));

app.get('/api/on', function(request, response) {
    exec('sudo python start.py', function (error, stdout, stderr) {
        if (error) {
            response.send('ERROR: ' + stderr.toString());
        } else {
            response.send(stdout.toString());
            var status = "On";
            console.log("Set" + status);
        }
    });
});

app.get('/api/off', function(request, response) {
    exec('sudo python stop.py', function (error, stdout, stderr) {
        if (error) {
            response.send('ERROR: ' + stderr.toString());
        } else {
            response.send(stdout.toString());
            var status = "Off";
        }
    });
});

app.get('/api/status', function(request, response) {
    response.send(status);
    console.log("Send" + status);
});

app.use(express.static(__dirname + '/www'));

app.listen(SERVER_PORT, function() {
    console.log('listening');
});
