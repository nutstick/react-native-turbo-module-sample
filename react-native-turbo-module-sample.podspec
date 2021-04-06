require "json"

package = JSON.parse(File.read(File.join(__dir__, "package.json")))

folly_compiler_flags = '-DFOLLY_NO_CONFIG -DFOLLY_MOBILE=1 -DFOLLY_USE_LIBCPP=1 -Wno-comma -Wno-shorten-64-to-32'

Pod::Spec.new do |s|
  s.name         = "react-native-turbo-module-sample"
  s.version      = package["version"]
  s.summary      = package["description"]
  s.homepage     = package["homepage"]
  s.license      = package["license"]
  s.authors      = package["author"]

  s.platforms    = { :ios => "10.0" }
  s.source       = { :git => "https://github.com/nutstick/react-native-turbo-module-sample.git", :tag => "#{s.version}" }

  s.compiler_flags         = folly_compiler_flags + ' -Wno-nullability-completeness'

  s.pod_target_xcconfig = {
    "DEFINES_MODULE" => "YES",
    "USE_HEADERMAP" => "YES",
    "CLANG_CXX_LANGUAGE_STANDARD" => "c++14",
    "HEADER_SEARCH_PATHS" => "\"$(PODS_TARGET_SRCROOT)/ReactCommon\" \"$(PODS_TARGET_SRCROOT)\" \"$(PODS_ROOT)/Headers/Private/React-Core\" "
  }

  s.source_files = "ios/**/*.{h,m,mm}", "spec/MySampleTurboModuleSpec-generated.mm", "spec/MySampleTurboModuleSpec.h"

  s.dependency "ReactCommon"
  s.dependency "RCTRequired"
  s.dependency "RCTTypeSafety"
  s.dependency "React-Core"
  s.dependency "React-jsi"
end
