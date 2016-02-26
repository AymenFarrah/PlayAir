//
//  UIView+Animations.swift
//  PlayAir
//
//  Created by Aymen on 24/02/2016.
//  Copyright © 2016 Farrah. All rights reserved.
//

import Foundation

extension UIView {
    
    func startDuangAnimation() {
        let options = [.CurveEaseInOut, .AllowAnimatedContent, .BeginFromCurrentState] as UIViewAnimationOptions
        
        UIView.animateWithDuration(0.15, delay: 0, options: options, animations: { () -> Void in
            self.layer.setValue(0.8, forKeyPath: "transform.scale")
            }) { (finished: Bool) -> Void in
                UIView.animateWithDuration(0.15, delay: 0, options: options, animations: { () -> Void in
                    self.layer.setValue(1.3, forKeyPath: "transform.scale")
                    }, completion: { (finished: Bool) -> Void in
                        self.layer.setValue(1, forKeyPath: "transform.scale")
                })
        }
    }
    
    func startTransitionAnimation() {
        let transition = CATransition()
        transition.duration = 1
        transition.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
        transition.type = kCATransitionFade        
        layer .addAnimation(transition, forKey: nil)
    }
}

