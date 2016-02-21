//
//  PARadioManager.swift
//  PlayAir
//
//  Created by Aymen on 21/02/2016.
//  Copyright © 2016 Farrah. All rights reserved.
//

import Foundation

class PARadioManager {

    static let sharedInstance = PARadioManager()

    private init() {
        initRadios()
    } //This prevents others from using the default '()' initializer for this class.

    private var radios = [PARadio]()

    /*
    override init() {
    }
    */
    
    func initRadios () {
        
        let radio1 = PARadio(radioId: 1, name: "Europe 1",
            url: NSURL(string: "http://mp3lg3.scdn.arkena.com/10489/europe1.mp3")!,
            picto: "europe1",
            desc: "Europe1, Radio d'informations et d'actualité.")

        let radio2 = PARadio(radioId: 2, name: "RTL",
            url: NSURL(string: "http://streaming.radio.rtl.fr/rtl-1-44-96")!,
            picto: "radio-rtl",
            desc: "Ecouter RTL en ligne pour découvrir les émissions d'informations et actualités économiques, politiques, sociales, judiciaires et sportives.")
        
        let radio3 = PARadio(radioId: 3, name: "RMC",
            url: NSURL(string: "http://rmc.scdn.arkena.com/rmc.mp3")!,
            picto: "rmc",
            desc: "RMC en direct : INFO TALK SPORT")
        
        
        let radio4 = PARadio(radioId: 4, name: "NRJ",
            url: NSURL(string: "http://95.81.147.24/8470/nrj_165631.mp3")!,
            picto: "nrj",
            desc: "Hit Music Only !")
        
        
        let radio5 = PARadio(radioId: 5, name: "BFM Business",
            url: NSURL(string: "http://bfmbusiness.scdn.arkena.com/bfmbusiness.mp3")!,
            picto: "bfm",
            desc: "BFM direct : L'essentiel de l'actualité économique et financière.")
        
        radios = [radio1, radio2, radio3, radio4, radio5]
    }
    
    
    func getRadios() -> [PARadio] {
        return radios
    }
    
}