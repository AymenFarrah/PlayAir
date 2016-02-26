//
//  PARadio.swift
//  PlayAir
//
//  Created by Aymen on 14/02/2016.
//  Copyright © 2016 Farrah. All rights reserved.
//

import Foundation

class PARadio: NSObject
{
    var radioId : Int!
    var name : String!
    var url : NSURL!
    var picto : String!
    var desc : String!
    var categories : Array<String>!
    var isFavorite : Bool!
    
    init(radioId: Int, name: String, url: NSURL, picto: String, desc: String, categories: Array<String>) {
        super.init()
        self.radioId = radioId
        self.name = name
        self.url = url
        self.picto = picto
        self.desc = desc
        self.categories = categories
        self.isFavorite = false
    }
    
    override var description: String {
        return "radioId: \(radioId)" +
            "name: \(name)" +
            "url: \(url)" +
            "picto: \(picto)" +
            "desc: \(desc)"
    }
    
}