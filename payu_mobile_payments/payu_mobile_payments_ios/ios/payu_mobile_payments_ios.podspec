#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html.
# Run `pod lib lint payu_mobile_payments_ios.podspec` to validate before publishing.
#
Pod::Spec.new do |s|
  s.name             = 'payu_mobile_payments_ios'
  s.version          = '0.0.1'
  s.summary          = 'iOS (ApplePay) implementation of payu_mobile_payments.'
  s.description      = <<-DESC
iOS (ApplePay) implementation of payu_mobile_payments.
                       DESC
  s.homepage         = 'https://github.com/PayU-EMEA/PayU-Flutter'
  s.license          = { :file => '../LICENSE' }
  s.author           = { 'PayU' => 'https://github.com/PayU-EMEA' }
  s.source           = { :path => '.' }
  s.source_files = 'payu_mobile_payments_ios/Sources/payu_mobile_payments_ios/**/*.swift'
  s.dependency 'Flutter'
  s.platform = :ios, '13.0'

  # Flutter.framework does not contain a i386 slice.
  s.pod_target_xcconfig = { 'DEFINES_MODULE' => 'YES', 'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'i386' }
  s.swift_version = '5.0'
end
