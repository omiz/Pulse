//
//  ViewController.swift
//  PulseDemo
//
//  Created by Omar Allaham on 2/17/17.
//  Copyright © 2017 Bemaxnet. All rights reserved.
//

import UIKit
import Pulse

class ViewController: UIViewController {

   @IBOutlet weak var pulseView: PulseView!
   @IBOutlet weak var layerView: UIView!
   var pulseLayer: PulseLayer!

   override func viewDidLoad() {
      super.viewDidLoad()

      pulseLayer = PulseLayer()
      pulseLayer.position = layerView.center
      pulseLayer.count = 10
      view.layer.addSublayer(pulseLayer)
      pulseLayer.animate()
   }

   override func didReceiveMemoryWarning() {
      super.didReceiveMemoryWarning()
      // Dispose of any resources that can be recreated.
   }

   @IBAction func toggleview(_ sender: UIButton) {
      pulseView.isAnimating = !pulseView.isAnimating
   }

   @IBAction func toggleLayer(_ sender: UIButton) {
      pulseLayer.isAnimating ? pulseLayer.stop() : pulseLayer.animate()
   }
}

