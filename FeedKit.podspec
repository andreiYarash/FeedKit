Pod::Spec.new do |s|
  s.name = 'FeedKit'
  s.version = '10.0.0'
  s.license = 'MIT'
  s.summary = 'An RSS, Atom and JSON Feed parser written in Swift'
  s.homepage = 'https://github.com/sebj/FeedKit'
  s.authors = { 'Nuno Manuel Dias' => 'nmdias.pt@gmail.com' }
  s.source = { :git => 'https://github.com/sebj/FeedKit.git', :tag => s.version }
  s.ios.deployment_target = '16.0'
  s.osx.deployment_target = '13.0'
  s.tvos.deployment_target = '16.0'
  s.watchos.deployment_target = '9.0'
  s.source_files = 'Sources/**/*.swift'
  s.swift_versions = ['5.7']
end
