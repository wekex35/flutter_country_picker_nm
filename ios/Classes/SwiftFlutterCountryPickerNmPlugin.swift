import Flutter
import UIKit

public class SwiftFlutterCountryPickerNmPlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "flutter_country_picker_nm", binaryMessenger: registrar.messenger())
    let instance = SwiftFlutterCountryPickerNmPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    if("getCountryNames" == call.method) {
        let args = call.arguments as! NSDictionary
        self.receiveCountryNames(result: result, isoCodes: args.value(forKey: "isoCodes") as! [String])
    } else {
        result("MethodNotImplemented")
    }
  }

  private func receiveCountryNames(result: FlutterResult, isoCodes: [String]) {
    var countryNames: Dictionary<String, String> = Dictionary.init()
    
    let currentLocale: Locale = Locale.current
    for code in isoCodes {
        countryNames[code] = currentLocale.localizedString(forRegionCode: code)
    }
    
    result(countryNames as NSDictionary)
  }
}
