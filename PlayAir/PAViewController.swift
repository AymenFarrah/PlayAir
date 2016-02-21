//
//  PAViewController.swift
//  PlayAir
//
//  Created by Aymen on 21/02/2016.
//  Copyright © 2016 Farrah. All rights reserved.
//

import Foundation
import Google

class PAViewController: UIViewController {
    
    
    var pageName: String!
 
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        let tracker = GAI.sharedInstance().defaultTracker
        tracker.set(kGAIScreenName, value: pageName)
        
        let builder = GAIDictionaryBuilder.createScreenView().build() as AnyObject
        tracker.send(builder as! [NSObject : AnyObject])
        
    }
    
}