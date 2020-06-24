//
//  PulseLayer.swift
//  Pulse
//
//  Created by Omar Allaham on 1/19/17.
//  Copyright © 2017 Bemaxnet. All rights reserved.
//

import QuartzCore
import UIKit

private typealias PulseAccessor = PulseLayer
private typealias PulseInit = PulseLayer
private typealias PulseSetup = PulseLayer
private typealias PulseCAAnimationDelegate = PulseLayer

class PulseLayer: CAReplicatorLayer {


   /**
    
    get only var indicate the if the layer is animating
    
    Type: Bool

    */
   open var isAnimating: Bool {
      return self.effect.animationKeys()?.count ?? 0 > 0
   }


   /**

    Pulse radius

    The default value of this property is 60

    on frame update value will be updated
    
    Type: CGFloat

    */
   open var radius: CGFloat = 60 {
      didSet {
         let diameter: CGFloat = radius * 2
         self.effect.bounds = CGRect(x: 0, y: 0, width: diameter, height:diameter)
         self.effect.cornerRadius = self.radius
      }
   }

   /**
    
    The pulse radius start animation point

    value should be from 0.0 to 1.0

    The default value of this property is 0.0
    
    Type: CGFloat

    */
   open var radiusFromValue: CGFloat = 0 {
      didSet {
         if isAnimating {
            animate()
         }
      }
   }

   /**

    The pulse Alpha start animation point

    value should be from 0.0 to 1.0

    The default value of this property is: 0.45
    
    Type: CGFloat

    */
   open var alphaFromValue: CGFloat = 0.45 {
      didSet {
         if isAnimating {
            animate()
         }
      }
   }

   /**

    The pulse Opacity mid animation point

    value should be from 0.0 to 1.0

    The default value of this property is 0.2
    
    Type: NSNumber

    */
   open var keyTimeForHalfOpacity: NSNumber = 0.2 {
      didSet {
         if isAnimating {
            animate()
         }
      }
   }

   /**

    The pulse duration for each replicated.

    The default value of this property is 3
    
    Type: TimeInterval
    
    */
   open var animationDuration: TimeInterval = 3 {
      didSet {
         self.instanceDelay = (self.animationDuration + self.pulseInterval) / Double(self.count)
      }
   }

   /**

    The pulse interval between each replicated.

    The default value of this property is 0
    
    Type: TimeInterval
    
    */
   open var pulseInterval: TimeInterval = 0 {
      didSet {
         if (pulseInterval == .infinity) {
            self.effect.removeAnimation(forKey: "pulse")
         }
      }
   }

   /**

    This value indicate if the animation should use timingFunction

    The default value of this property is true

    Type: Bool

    */
   open var useTimingFunction: Bool = true {
      didSet {
         if isAnimating {
            animate()
         }
      }
   }

   /**

    This count of the visible pulses

    The default value of this property is 1

    Type: NSInteger
    
    */
   open var count: NSInteger = 1 {
      didSet {
         self.instanceCount = count
         self.instanceDelay = (self.animationDuration + self.pulseInterval) / Double(count)
      }
   }

   /**

    This start delay of the animation

    The default value of this property is 1

    Type: TimeInterval
    
    */
   open var startInterval: TimeInterval = 1 {
      didSet {
         self.instanceDelay = startInterval
      }
   }

   /**

    This color of the pulse

    Type: CGColor?
    
    */
   open var color: UIColor = UIColor.lightGray {
      didSet {
         self.effect.backgroundColor = color.cgColor
      }
   }

   let effect: CALayer = CALayer()

   var animationGroup: CAAnimationGroup!

   override init() {
      super.init()

      self.effect.contentsScale = UIScreen.main.scale
      self.effect.opacity = 0
      self.addSublayer(self.effect)

      self.setupDefaults()
   }

   override init(layer: Any) {
      super.init(layer: layer)
   }

   required init(coder aDecoder: NSCoder) {
      super.init()
   }
}

extension PulseInit {
   convenience init(in layer: CALayer) {
      self.init()

      layer.addSublayer(self)
      frame = layer.frame
      position = layer.position
   }
}

extension PulseAccessor {

   /**

    Starts the pulse animation

    return: void
    
    */
   open func animate() {
      if isAnimating {
         stop()
      }

      setupAnimationGroup()
      self.effect.add(animationGroup!, forKey: "pulse")
   }

   /**

    Stops the animation

    return: void
    
    */
   open func stop() {
      self.effect.removeAllAnimations()
   }

   override var frame: CGRect {
      didSet {
         self.effect.frame = bounds
         radius = min(frame.width, frame.height)
      }
   }

   /**

    Repeat count

    Type: Float

    */
   override var repeatCount: Float {
      didSet {
         self.animationGroup?.repeatCount = repeatCount
      }
   }
}

extension PulseSetup {

   func setupDefaults() {
      radiusFromValue = 0.0
      keyTimeForHalfOpacity = 0.2
      animationDuration = 3
      pulseInterval = 0
      useTimingFunction = true

      self.repeatCount = .infinity
      self.radius = 60
      self.count = 1
      self.startInterval = 1
      self.color = UIColor(red: 0, green: 0.455, blue: 0.756, alpha: alphaFromValue)
   }

   func setupAnimationGroup() {
      animationGroup = CAAnimationGroup()
      animationGroup.duration = self.animationDuration + self.pulseInterval
      animationGroup.repeatCount = self.repeatCount

      if self.useTimingFunction {
        let defaultCurve = CAMediaTimingFunction(name: CAMediaTimingFunctionName.default)
         animationGroup.timingFunction = defaultCurve
      }

      let animations: [CAAnimation] = [scale(), opacityAnimation()]

      animationGroup.animations = animations

      animationGroup.delegate = self
   }

   private func scale() -> CAAnimation {
      let anim = CABasicAnimation(keyPath: "transform.scale.xy")

      anim.fromValue = self.radiusFromValue
      anim.toValue = 1.0
      anim.duration = self.animationDuration

      return anim
   }

   private func opacityAnimation() -> CAAnimation {
      let anim = CAKeyframeAnimation(keyPath: "opacity")
      anim.duration = self.animationDuration

      let alphaFromValue = self.color.cgColor.alpha
      anim.values = [alphaFromValue, alphaFromValue * 0.5, 0];
      anim.keyTimes = [0, keyTimeForHalfOpacity, 1.0];

      return anim
   }
}

extension PulseCAAnimationDelegate: CAAnimationDelegate {

   func animationDidStop(_ anim: CAAnimation, finished flag: Bool) {
//      self.effect.removeAllAnimations()
//
//      self.effect.removeFromSuperlayer()
//
//      self.removeFromSuperlayer()
   }
}
