#
# Be sure to run `pod lib lint TVMaskField.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'TVMaskField'
  s.version          = '1.0.1'
  s.summary          = 'A swift library to handle string masks on textfields.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
An easy way to handle formatation on textfield inputs.
Just define a mask to start using it.
                       DESC

  s.homepage         = 'https://github.com/thalysviana/TVMaskField'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Thalys Viana' => 'your email here' }
  s.source           = { :git => 'https://github.com/thalysviana/TVMaskField.git', :tag => s.version.to_s }

  s.ios.deployment_target = '12.0'
  
  s.swift_version = '5.0'

  s.source_files = 'TVMaskField/Classes/**/*'
  
  s.frameworks = 'UIKit'
  
end
