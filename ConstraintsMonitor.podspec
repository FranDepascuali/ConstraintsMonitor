#
# Be sure to run `pod lib lint ConstraintsMonitor.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'ConstraintsMonitor'
  s.version          = '0.1.0'
  s.summary          = 'A tool to understand constraints warnings. No setup needed.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
ConstraintsMonitor adds some convenience extensions to print nicer constraints warnings.
                       DESC

  s.homepage         = 'https://github.com/FranDepascuali/ConstraintsMonitor'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'FranDepascuali' => 'depa.developer@gmail.com' }
  s.source           = { :git => 'https://github.com/FranDepascuali/ConstraintsMonitor.git', :tag => s.version.to_s }
  s.ios.deployment_target = '9.0'
  s.source_files = 'ConstraintsMonitor/Classes/**/*'
  s.swift_versions = ['3.2', '4.0', '4.1', '4.2', '5.0', '5.1', '5.2']
  # s.resource_bundles = {
  #   'ConstraintsMonitor' => ['ConstraintsMonitor/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
