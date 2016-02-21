//
//  PARadioItemCell.swift
//  PlayAir
//
//  Created by Aymen on 21/02/2016.
//  Copyright © 2016 Farrah. All rights reserved.
//

import Foundation

class PARadioItemCell : UITableViewCell {
    
    @IBOutlet var title: UILabel!
    @IBOutlet var subtitle: UILabel!
    @IBOutlet var picto: UIImageView!
    @IBOutlet var playButton: UIButton!
    
    var radio: PARadio! {
        didSet {
            title.text = radio.name
            subtitle.text = radio.desc
            picto.image = UIImage(named: radio.picto)
        }
    }
    
}
