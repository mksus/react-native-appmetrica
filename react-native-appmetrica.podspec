require 'json'

package = JSON.parse(File.read(File.join(__dir__, 'package.json')))

Pod::Spec.new do |s|
  s.name         = "react-native-appmetrica"
  s.version      = package['version']
  s.summary      = package['description']
  s.license      = package['license']

  s.authors      = package['author']
  s.homepage     = package['repository']['url']
  s.platform     = :ios, "9.0"
  s.ios.deployment_target = '9.0'
  s.tvos.deployment_target = '10.0'

  s.source       = { :git => "https://github.com/ZloyRob/react-native-appmetrica.git", :tag => "v#{s.version}" }
  s.source_files  = "ios/**/*.{h,m}"

  s.weak_frameworks        = 'YandexMobileMetrica'
  s.pod_target_xcconfig    = {
    'FRAMEWORK_SEARCH_PATHS' => '"$(PODS_ROOT)/YandexMobileMetrica/dynamic/**"',
  }

  s.dependency 'React'
end
