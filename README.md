# Pulse
Animated Pulse layer and view

## Requirements

- iOS 8.0+
- Xcode 8.0+
- Swift 3.0+

## Installation

### CocoaPods

[CocoaPods](http://cocoapods.org) is a dependency manager for Cocoa projects. You can install it with the following command:

```bash
$ gem install cocoapods
```

To integrate AlamofireNetworkActivityIndicator into your Xcode project using CocoaPods, specify it in your `Podfile`:

```ruby
source 'https://github.com/CocoaPods/Specs.git'
platform :ios, '8.0'
use_frameworks!

#https://github.com/omiz/Pulse
pod 'Pulse', '~> 1.0'
```

Then, run the following command:

```bash
$ pod install
```

### Manually

If you prefer not to use CocoaPods dependency manager, you can integrate Pulse into your project manually.

Copy the .swift files into your project or clone and include Pulse repo into your project

## Usage
### To use the layer:

```swift
    let pulseLayer = PulseLayer()
    pulseLayer.position = view.center
    pulseLayer.count = 10
    view.layer.addSublayer(pulseLayer)
    pulseLayer.start()
```

### To use the view:

#### Directly in the layout builder:
Enjoy the Inspectable parameters

#### Programmatically:

```swift
    let pulseView = PulseView(frame: frame)
    pulseView.count = 10
    pulseView.color = UIColor.blue
    view.addSubview(pulseView)
    pulseView.isActive = true
```

## Todo
- [x] Submit to CocoaPods
- [ ] Add demo
- [ ] your suggestions

## License

MIT
