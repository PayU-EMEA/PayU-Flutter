#import "PayuMobilePaymentsIosPlugin.h"
#if __has_include(<payu_mobile_payments_ios/payu_mobile_payments_ios-Swift.h>)
#import <payu_mobile_payments_ios/payu_mobile_payments_ios-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "payu_mobile_payments_ios-Swift.h"
#endif

@implementation PayuMobilePaymentsIosPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftPayuMobilePaymentsIosPlugin registerWithRegistrar:registrar];
}
@end
