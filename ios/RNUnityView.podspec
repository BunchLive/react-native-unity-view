require 'json'
package = JSON.parse(File.read('../package.json'))

Pod::Spec.new do |s|
  s.name                = "RNUnityView"
  s.version             = package["version"]
  s.description         = package["description"]
  s.summary             = <<-DESC
                            Integrate a Unity project into a react-native application.
                          DESC
  s.homepage            = "https://bunch.live"
  s.license             = package['license']
  s.authors             = "Bunch Studios Inc."
  s.source              = { :git => "https://github.com/BunchLive/react-native-unity-view.git", :tag => "v#{s.version}" }
  s.social_media_url    = 'http://twitter.com/BunchLive'
  s.platform            = :ios, "9.0"
  s.source_files        = '*.{h,m}'
  s.dependency 'React'
  s.dependency 'React-Core'
  s.dependency 'React-DevSupport'
  s.dependency 'React-fishhook'
  s.dependency 'React-RCTActionSheet'
  s.dependency 'React-RCTAnimation'
  s.dependency 'React-RCTBlob'
  s.dependency 'React-RCTImage'
  s.dependency 'React-RCTLinking'
  s.dependency 'React-RCTNetwork'
  s.dependency 'React-RCTSettings'
  s.dependency 'React-RCTText'
  s.dependency 'React-RCTVibration'
  s.dependency 'React-RCTWebSocket'
  s.dependency 'React-cxxreact'
  s.dependency 'React-jsi'
  s.dependency 'React-jsiexecutor'
  s.dependency 'React-jsinspector'
  s.dependency 'yoga'
  s.dependency 'DoubleConversion'
  s.dependency 'glog'
  s.dependency 'Folly'
  s.xcconfig = { 'USER_HEADER_SEARCH_PATHS' => '"${PROJECT_DIR}/../UnityExport"/**' }
  
end
