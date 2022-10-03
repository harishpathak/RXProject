# Disable sending stats
ENV['COCOAPODS_DISABLE_STATS'] = 'true'

source 'https://github.com/CocoaPods/Specs.git'

platform :ios, :deployment_target => '11.0'


inhibit_all_warnings!
use_frameworks!

def branch
    pod 'Branch', '~> 1.39.1'
end

def rx_swift
    pod 'RxSwift', '5.1.1'
end

def rx_swift_datasource
    pod 'RxDataSources', '4.0.1'
end

def rx_cocoa
    pod 'RxCocoa', '5.1.1'
end

def objectMapper
    pod 'ObjectMapper', '3.5.1'
end

def test_pods
    pod 'RxTest', '5.0.1'
    pod 'RxBlocking', '5.0.1'
    pod 'OHHTTPStubs/Swift'
    pod 'ObjectMapper', '3.5.1'
    pod 'SwiftyMocky', '4.1.0'
end

def injector
    pod 'Swinject', '~> 2.7.1'
    pod 'SwinjectStoryboard', :git => 'https://github.com/Swinject/SwinjectStoryboard.git', :branch => 'master'
end

target 'RXProject' do
    rx_swift
    rx_cocoa
    injector
    objectMapper
   
    target 'RXProjectTests' do
        inherit! :complete
        test_pods
    end
end
