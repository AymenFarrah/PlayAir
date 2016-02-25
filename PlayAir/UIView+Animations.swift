//
//  UIView+Animations.swift
//  PlayAir
//
//  Created by Aymen on 24/02/2016.
//  Copyright © 2016 Farrah. All rights reserved.
//

import Foundation

extension UIView {
    
    func startTransitionAnimation() {
        let transition = CATransition()
        transition.duration = 1
        transition.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
        transition.type = kCATransitionFade        
        layer .addAnimation(transition, forKey: nil)
    }
}