# Pulse
Animated Pulse layer and view

## Usage
### To use the layer:

    let pulseLayer = PulseLayer()
    pulseLayer.position = view.center
    pulseLayer.count = 10
    view.layer.addSublayer(pulseLayer)
    pulseLayer.start()

### To use the view:

#### Directly in the layout builder:
Enjoy the Inspectable parameters

#### Programmatically:

    let pulseView = PulseView(frame: frame)
    pulseView.count = 10
    pulseView.color = UIColor.blue
    view.addSubview(pulseView)
    pulseView.isActive = true
    
## Install

Copy the files to your project

## Todo
- Submit to CocoaPods
- your suggestions

## License

MIT
