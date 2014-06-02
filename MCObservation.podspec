Pod::Spec.new do |s|
  s.name     = 'MCObservation'
  s.version  = '0.1'
  s.platform = :ios, '7.0'
  s.license  = { :type => 'MIT', :file => 'LICENSE' }
  s.summary  = 'Easy-to-use, fire-and-forget KVO and notifications.'
  s.homepage = 'https://github.com/matthewcheok/MCObservation'
  s.author   = { 'Matthew Cheok' => 'cheok.jz@gmail.com' }
  s.requires_arc = true
  s.source   = {
    :git => 'https://github.com/matthewcheok/MCObservation.git',
    :branch => 'master',
    :tag => s.version.to_s
  }
  s.source_files = 'MCObservation/*.{h,m}'
  s.public_header_files = 'MCObservation/*.h'
end
