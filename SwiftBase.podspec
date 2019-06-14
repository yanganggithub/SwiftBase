Pod::Spec.new do |s|

s.name         = "SwiftBase"
s.version      = "0.0.2"
#主要标题
s.summary      = "a swift fast development framework"
#详细描述（必须大于主要标题的长度）
s.description  = <<-DESC
I think you like it beleive me haha
DESC
#仓库主页
s.homepage     = "https://github.com/yanganggithub/SwiftBase"
s.license      = "MIT"
s.author       = { "yangang" => "1053316540@qq.com" }
s.platform     = :ios,'8.0'
#仓库地址（注意下tag号）
s.source       = { :git => "https://github.com/yanganggithub/SwiftBase.git", :tag => "#{s.version}" }
#这里路径必须正确，因为swift只有一个文件不需要s.public_header_files
#s.public_header_files = "Classes/*.h"
s.source_files = "SwiftBase","SwiftBase/**/*.swift","SwiftBase/OCBase/*.modulemap"
#s.preserve_path = "SwiftBase/OCBase/*.modulemap"
s.xcconfig = { "SWIFT_INCLUDE_PATHS" => "$(PODS_ROOT)/SwiftBase/OCBase"}
s.framework  = "SwiftBase"
s.frameworks    = "UIKit","Foundation"


# ――― Project Settings ――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
#
#  If your library depends on compiler flags you can set them in the xcconfig hash
#  where they will only apply to your library. If you depend on other Podspecs
#  you can include multiple dependencies to ensure it works.

s.requires_arc = true
s.pod_target_xcconfig = {
'SWIFT_INCLUDE_PATHS[sdk=iphoneos*]'         => '$(PODS_ROOT)/SwiftBase/CocoaPods/iphoneos',
'SWIFT_INCLUDE_PATHS[sdk=iphonesimulator*]'      => '$(PODS_ROOT)/SwiftBase/CocoaPods/iphonesimulator' }

s.dependency 'RealmSwift'
s.dependency 'AlamofireObjectMapper'
s.dependency 'Alamofire', '5.0.0-beta.6'
s.dependency 'MJRefresh'
s.dependency 'KeychainSwift','~> 9.0.0'
s.dependency 'Kingfisher'
s.dependency 'ReachabilitySwift',s.swift_version='4.2'
s.dependency 'SwiftyJSON',s.swift_version='4.2'
s.dependency 'Masonry'



end
