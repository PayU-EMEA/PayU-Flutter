#import "PayuApplePayPlugin.h"
#if __has_include(<payu_apple_pay/payu_apple_pay-Swift.h>)
#import <payu_apple_pay/payu_apple_pay-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "payu_apple_pay-Swift.h"
#endif

@implementation PayuApplePayPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftPayuApplePayPlugin registerWithRegistrar:registrar];
}
@end
