//
//  PulseView.swift
//  Pulse
//
//  Created by Omar Allaham on 1/19/17.
//  Copyright © 2017 Bemaxnet. All rights reserved.
//

import UIKit

class PulseView: UIView {

   var pulseLayer = PulseLayer()

   @IBInspectable open var isAnimating: Bool = true {
      didSet {
         if isAnimating {
            pulseLayer.animate()
         } else {
            pulseLayer.stop()
         }
      }
   }

   @IBInspectable open var radius: CGFloat {
      get {
         return pulseLayer.radius
      }
      set(value) {
         pulseLayer.radius = value
      }
   }

   @IBInspectable open var radiusFromValue: CGFloat {
      get {
         return pulseLayer.radiusFromValue
      }
      set(value) {
         pulseLayer.radiusFromValue = value
      }
   }

   @IBInspectable open var alphaFromValue: CGFloat {
      get {
         return pulseLayer.alphaFromValue
      }
      set(value) {
         pulseLayer.alphaFromValue = value
      }
   }

   @IBInspectable open var keyTimeForHalfOpacity: NSNumber {
      get {
         return pulseLayer.keyTimeForHalfOpacity
      }
      set(value) {
         pulseLayer.keyTimeForHalfOpacity = value
      }
   }

   @IBInspectable open var animationDuration: TimeInterval {
      get {
         return pulseLayer.animationDuration
      }
      set(value) {
         pulseLayer.animationDuration = value
      }
   }

   @IBInspectable open var pulseInterval: TimeInterval {
      get {
         return pulseLayer.pulseInterval
      }
      set(value) {
         pulseLayer.pulseInterval = value
      }
   }

   @IBInspectable open var useTimingFunction: Bool {
      get {
         return pulseLayer.useTimingFunction
      }
      set(value) {
         pulseLayer.useTimingFunction = value
      }
   }

   @IBInspectable open var count: Int {
      get {
         return pulseLayer.count
      }
      set(value) {
         pulseLayer.count = value
      }
   }

   @IBInspectable open var startInterval: TimeInterval {
      get {
         return pulseLayer.startInterval
      }
      set(value) {
         pulseLayer.startInterval = value
      }
   }

   @IBInspectable open var color: UIColor {
      get {
         return pulseLayer.color
      }
      set(value) {
         pulseLayer.color = value
      }
   }

   @IBInspectable open var repeatCount: Float {
      get {
         return pulseLayer.repeatCount
      }
      set(value) {
         pulseLayer.repeatCount = value
      }
   }

   override func layoutSubviews() {
      super.layoutSubviews()

      if !(layer.sublayers?.contains(pulseLayer) ?? false) {
         layer.addSublayer(pulseLayer)
      }

      pulseLayer.position = self.center
      pulseLayer.frame = self.bounds
   }
}
