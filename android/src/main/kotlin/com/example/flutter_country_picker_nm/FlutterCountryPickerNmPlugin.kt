package com.example.flutter_country_picker_nm

import androidx.annotation.NonNull

import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result
import java.util.*

/** FlutterCountryPickerNmPlugin */
class FlutterCountryPickerNmPlugin: FlutterPlugin, MethodCallHandler {
  /// The MethodChannel that will the communication between Flutter and native Android
  ///
  /// This local reference serves to register the plugin with the Flutter Engine and unregister it
  /// when the Flutter Engine is detached from the Activity
  private lateinit var channel : MethodChannel

  override fun onAttachedToEngine(@NonNull flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
    channel = MethodChannel(flutterPluginBinding.binaryMessenger, "flutter_country_picker_nm")
    channel.setMethodCallHandler(this)
  }

  override fun onDetachedFromEngine(@NonNull binding: FlutterPlugin.FlutterPluginBinding) {
    channel.setMethodCallHandler(null)
  }

  override fun onMethodCall(call: MethodCall, result: Result): Unit {
    val GET_COUNTRY_NAMES = "getCountryNames"
    if (call.method.equals(GET_COUNTRY_NAMES)) {
      result.success(getAllCountryNames(call.argument("isoCodes")))
    } else {
      result.notImplemented()
    }
  }

  private fun getAllCountryNames(isoCodes: ArrayList<String>?): HashMap<String, String> {
    val localCountries = HashMap<String, String>()
    for (isoCode:String in isoCodes!!.filterNotNull()) {
      localCountries[isoCode] = Locale("", isoCode).displayCountry
    }
    return localCountries
  }
}
