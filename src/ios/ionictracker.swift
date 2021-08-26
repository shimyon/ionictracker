@objc(ionictracker) class ionictracker : CDVPlugin, CLLocationManagerDelegate{

    // MARK: Properties
    var pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR)
    var locationManager = CLLocationManager()
    var latitudeVal:Float = 0
    var longitudeVal:Float = 0

    //This method is called when the plugin is initialized; plugin setup methods got here
    override func pluginInitialize() {
        locationManager.delegate = self
    }

    /* This methods accepts 2 int params from ionic app
     Adds the 2 numbers and sends back the sum or error to ionic */
    @objc(add:) func add(_ command: CDVInvokedUrlCommand) {
        var pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR)
        let param1 = (command.arguments[0] as? NSObject)?.value(forKey: "param1") as? Int
        let param2 = (command.arguments[0] as? NSObject)?.value(forKey: "param2") as? Int

        if let p1 = param1 , let p2 = param2 {
            if p1 >= 0 && p1 >= 0{
                let total = String(p1 + p2)

                pluginResult = CDVPluginResult(status: CDVCommandStatus_OK,
                                               messageAs: total)
            } else {
                pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR,
                                               messageAs: "Something wrong")
            }
        }
        self.commandDelegate!.send(pluginResult,
                                   callbackId: command.callbackId)
    }

    /* This methods accepts string messgae from ionic app
     and returns a message */
    @objc(coolMethod:) func coolMethod(_ command: CDVInvokedUrlCommand?) {
        var pluginResult: CDVPluginResult? = nil
        let echo = command?.arguments[0] as? String
        if let echoString = echo{
            pluginResult = CDVPluginResult(status: CDVCommandStatus_OK, messageAs: "\(echoString)!! from India")
        } else {
            pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR)
        }

        commandDelegate.send(pluginResult, callbackId: command?.callbackId)
    }

    /* This methods accepts string messgae from ionic app
     and returns a message */
    @objc(getStatus:) func getStatus(_ command: CDVInvokedUrlCommand?) {
        var pluginResult: CDVPluginResult? = nil
        
        let locStatus = CLLocationManager.authorizationStatus()
        var locStatusString = "notDetermined"
        switch locStatus {
              case .notDetermined:
                locStatusString = "notDetermined"
                break
              case .denied:
                locStatusString = "denied"
                break
              case .restricted:
                locStatusString = "restricted"
                break
              case .authorizedWhenInUse:
                locStatusString = "authorizedWhenInUse"
                break
              case .authorizedAlways:
                locStatusString = "authorizedAlways"
                break
              default:
                locStatusString = "unknow"
              break
        }
        pluginResult = CDVPluginResult(status: CDVCommandStatus_OK, messageAs: locStatusString)
        
        commandDelegate.send(pluginResult, callbackId: command?.callbackId)
    }
    
    /* This methods accepts string messgae from ionic app
     and returns a message */
    @objc(requestToLocationService:) func requestToLocationService(_ command: CDVInvokedUrlCommand?) {
        var pluginResult: CDVPluginResult? = nil
        pluginResult = CDVPluginResult(status: CDVCommandStatus_OK, messageAs: "OK")
        
//        if let bundleId = Bundle.main.bundleIdentifier,
//           let url = URL(string: "\(string:UIApplicationOpenSettingsURLString)&path=LOCATION/\(bundleId)") {
//                UIApplication.shared.open(url, options: [:], completionHandler: nil)
//        }
        
        locationManager.requestAlwaysAuthorization()
        commandDelegate.send(pluginResult, callbackId: command?.callbackId)
    }

    
    /* This methods accepts string messgae from ionic app
     and returns a message */
    @objc(startTracking:) func startTracking(_ command: CDVInvokedUrlCommand?) {
        var pluginResult: CDVPluginResult? = nil
        let echo = command?.arguments[0] as? String
        if let echoString = echo{
            pluginResult = CDVPluginResult(status: CDVCommandStatus_OK, messageAs: "\(echoString)!! from India")
        } else {
            pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR)
        }

        commandDelegate.send(pluginResult, callbackId: command?.callbackId)
    }   

            /* This methods accepts string messgae from ionic app
     and returns a message */
    @objc(stopTracking:) func stopTracking(_ command: CDVInvokedUrlCommand?) {
        var pluginResult: CDVPluginResult? = nil
        let echo = command?.arguments[0] as? String
        if let echoString = echo{
            pluginResult = CDVPluginResult(status: CDVCommandStatus_OK, messageAs: "\(echoString)!! from India")
        } else {
            pluginResult = CDVPluginResult(status: CDVCommandStatus_ERROR)
        }

        commandDelegate.send(pluginResult, callbackId: command?.callbackId)
    }
    
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        latitudeVal = Float(locations[0].coordinate.latitude)
        longitudeVal = Float(locations[0].coordinate.longitude)
        NSLog("%f", locations[0].coordinate.latitude);
        NSLog("%f", locations[0].coordinate.longitude);
    }
    
}
