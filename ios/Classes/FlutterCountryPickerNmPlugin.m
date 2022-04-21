#import "FlutterCountryPickerNmPlugin.h"
#if __has_include(<flutter_country_picker_nm/flutter_country_picker_nm-Swift.h>)
#import <flutter_country_picker_nm/flutter_country_picker_nm-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "flutter_country_picker_nm-Swift.h"
#endif

@implementation FlutterCountryPickerNmPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftFlutterCountryPickerNmPlugin registerWithRegistrar:registrar];
}
@end
