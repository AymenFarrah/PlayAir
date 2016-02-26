//
//  PAPlayerData.swift
//  PlayAir
//
//  Created by Aymen on 25/02/2016.
//  Copyright © 2016 Farrah. All rights reserved.
//

import Foundation


@objc public enum PlayState : Int {
    case Ready = 0
    case Running = 1
    case Playing = 2
    case Buffering = 3
    case Paused = 4
    case Stopped = 5
    case Error = 6
    case Disposed = 7
}

class PAPlayerData: NSObject {
    
    dynamic var songTitle : String?
    dynamic var songBitrate : String?
    dynamic var playerState : PlayState
    
    init(title: String, bitrate: String, state:PlayState) {
        songTitle = title
        songBitrate = bitrate
        playerState = state
        super.init()
    }
}