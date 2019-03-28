Pod::Spec.new do |s|

s.name         = "SwiftBase"
s.version      = "0.0.1"
#主要标题
s.summary      = "a swift fast development framework"
#详细描述（必须大于主要标题的长度）
s.description  = <<-DESC
I think you like it beleive me haha
DESC
#仓库主页
s.homepage     = "https://github.com/yanganggithub/SwiftBase"
s.license      = "MIT"
s.author       = { "fanxiangyang" => "fqsyfan@gmail.com" }
s.platform     = :ios,'8.0'
#仓库地址（注意下tag号）
s.source       = { :git => "https://github.com/yanganggithub/SwiftBase.git", :tag => "#{s.version}" }
#这里路径必须正确，因为swift只有一个文件不需要s.public_header_files
#s.public_header_files = "Classes/*.h"
s.source_files = "SwiftBase","SwiftBase/**/*.swift"
s.framework    = "UIKit","Foundation"
s.requires_arc = true


s.dependency 'RealmSwift'
s.dependency 'AlamofireObjectMapper'
s.dependency 'MJRefresh'
s.dependency 'KeychainSwift'
s.dependency 'Kingfisher'
s.dependency 'ReachabilitySwift'
s.dependency 'SwiftyJSON'
s.dependency 'Masonry'


end
