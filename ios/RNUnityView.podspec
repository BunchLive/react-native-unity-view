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
  s.dependency          'React'
end
