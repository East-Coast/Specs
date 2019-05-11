Pod::Spec.new do |spec|
  spec.name           = "XGPush_Swift"
  spec.version          = "3.2.3"
  spec.summary          = "腾讯信鸽（XG Push）"
  spec.homepage         = "http://xg.qq.com"
  spec.authors          = "tencent TEG"
  spec.license          = "MIT"
  spec.platform         = :ios, "6.0"
  spec.frameworks       = "CFNetwork", "SystemConfiguration", "CoreTelephony", "CoreGraphics", "Foundation", "UserNotifications"
  spec.libraries        = "z", "sqlite3"
  spec.source         = { :git => "https://github.com/xingePush/XGPush.git" }
  spec.source_files       = "XGPush/*.h","XGPush/Read.m"
  spec.vendored_libraries   = "XGPush/*.a"
  spec.xcconfig            = { "LIBRARY_SEARCH_PATHS" => "\"$(PODS_ROOT)/XGPush_Swift/**\"" }
  spec.static_framework = true



  spec.prepare_command = <<-EOF
    touch XGPush/Read.m
    cat <<-EOF > XGPush/Read.m
    //framework module QQ_XGPush {
    //  header "XGPush.h"
    //  export *
    //  link "z"
    //  link "sqlite3"
    //}
    \EOF
  EOF
end