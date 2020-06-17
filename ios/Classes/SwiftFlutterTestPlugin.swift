import Flutter
import UIKit

public class SwiftFlutterTestPlugin: NSObject, FlutterPlugin {
 	public static func register(with registrar: FlutterPluginRegistrar) {
        let channel = FlutterMethodChannel(name: "platform_origin_dialog", binaryMessenger: registrar.messenger())
        let instance = SwiftFlutterTestPlugin()
        registrar.addMethodCallDelegate(instance, channel: channel)
    }

    public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
        if call.method == "show_dialog" {
            let arguments = call.arguments as! [String: Any]
            guard let title = arguments["title"] as? String,
                let message = arguments["message"] as? String else {
                    result(FlutterError.init(code: "ArgumentError", message: "Required argument does not exist.", details: nil));
                    return
            }
            let alert: UIAlertController = UIAlertController(title: title, message: message, preferredStyle:  UIAlertController.Style.alert)
            let controller : FlutterViewController = UIApplication.shared.keyWindow?.rootViewController as! FlutterViewController;
            let defaultAction: UIAlertAction = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler:{
                (action: UIAlertAction!) -> Void in
                result("Tap OK")
            })
            let cancelAction: UIAlertAction = UIAlertAction(title: "Cancel", style: UIAlertAction.Style.cancel, handler:{
                (action: UIAlertAction!) -> Void in
                result("Tap Cancel")
            })

            alert.addAction(cancelAction)
            alert.addAction(defaultAction)
            controller.present(alert, animated: true, completion: nil)
        }
    }
}
