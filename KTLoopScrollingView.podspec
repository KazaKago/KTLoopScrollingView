Pod::Spec.new do |s|
  s.name         = "KTLoopScrollingView"
  s.version      = "1.0.0"
  s.license      = { :type => 'MIT', :file => 'LICENSE' }
  s.summary      = "loop animation view like an electric scoreboard"
  s.homepage     = "https://github.com/weathercock/KTLoopScrollingView"
  s.authors      = { "Kazamidori" => "http://weathercock.tmrnk.com/" }
  s.source       = { :git => "https://github.com/weathercock/KTLoopScrollingView.git", :tag => "v#{s.version}" }
  s.platform     = :ios, '5.0'
  s.source_files = 'KTLoopScrollingView'
  s.requires_arc = true
end