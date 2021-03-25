var exec = require('cordova/exec');
var pluginname = 'ionictracker';
exports.coolMethod = function(arg0, success, error) {
    exec(success, error, pluginname, 'coolMethod', [arg0]);
};

exports.add = function(arg0, success, error) {
    //const x = cordova(this, 'add', {}, [{ param1: num1, param2: num2 }]);
    exec(success, error, pluginname, 'add', [arg0]);
};

exports.startTracking = function(arg0, success, error) {
    //const x = cordova(this, 'add', {}, [{ param1: num1, param2: num2 }]);
    exec(success, error, pluginname, 'startTracking', [arg0]);
};

exports.stopTracking = function(arg0, success, error) {
    exec(success, error, pluginname, 'stopTracking', [arg0]);
};

exports.getStatus = function(arg0, success, error) {
    exec(success, error, pluginname, 'getStatus', [arg0]);
};

exports.requestToLocationService = function(arg0, success, error) {
    exec(success, error, pluginname, 'requestToLocationService', [arg0]);
};