//
//  PARadioListViewController.swift
//  PlayAir
//
//  Created by Aymen on 21/02/2016.
//  Copyright © 2016 Farrah. All rights reserved.
//

import Foundation
import StreamingKit

class PARadioListViewController: PAViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pageName = "radiolist"
    }
    
    
    
    // MARK : tableview data source
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return PARadioManager.sharedInstance.getRadios().count
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("PARadioItemCell", forIndexPath: indexPath)
            as! PARadioItemCell
        
        let radio = PARadioManager.sharedInstance.getRadios()[indexPath.row] as PARadio
        cell.radio = radio
        return cell
    }
    

    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let controller = UIStoryboard(name: "MusicPlayer", bundle: NSBundle.mainBundle()).instantiateViewControllerWithIdentifier("PAMusicPlayerViewController") as! PAMusicPlayerViewController
        
        
        controller.radio = PARadioManager.sharedInstance.getRadios()[indexPath.row]
        presentViewController(controller, animated: true, completion: nil)

    }
    
    
}