//
//  PAPlayerManager.swift
//  PlayAir
//
//  Created by Aymen on 14/02/2016.
//  Copyright © 2016 Farrah. All rights reserved.
//

import Foundation
import StreamingKit
import LGAudioStreamHelper




class PAPlayerManager: NSObject, STKAudioPlayerDelegate {

    private static let singleton = PAPlayerManager()
    
    class func sharedManager() -> PAPlayerManager{
        return singleton
    }
    
    private let player: STKAudioPlayer = STKAudioPlayer()
    private(set) var playerData : PAPlayerData?
    var currentRadio : PARadio?
    
    func play(radio: PARadio) {        
        currentRadio = radio
        let itemId = radio.url
        let dataSource = STKAudioPlayer.dataSourceFromURL(radio.url!)
        player.setDataSource(dataSource, withQueueItemId: itemId!)
    }
    
    func stop() {
        
        currentRadio = nil
        player.stop()
    }
    
    func initDatafNecessary() {
        if playerData == nil {
            playerData = PAPlayerData(title: "", bitrate: "", state: .Ready)
        }
        self.player.delegate = self
        self.player.volume = 1
        self.player.meteringEnabled = true
    }
    
    
    // MARK: DELEGATE
    func audioPlayer(audioPlayer: STKAudioPlayer, didStartPlayingQueueItemId queueItemId: NSObject) {
        
        let url = queueItemId as! NSURL
        let metaData = LGAudioStreamMetadataGetter()
        metaData.getMetadataFromUrl(url) { (dict:[NSObject : AnyObject]!, response:NSHTTPURLResponse!, error:NSError!) -> Void in
            
            print("************")
            print(dict)
            print("************")
            
            if let title = dict["StreamTitle"] {
                self.playerData?.songTitle = title as? String
            }
            else if let subtitle = dict["icy-name"] {
                self.playerData?.songTitle = subtitle as? String
            }
            
            if let bitrate = dict["icy-br"] {
                self.playerData?.songBitrate = bitrate as? String
            }
            
            self.playerData!.playerState = .Playing
            
        }
    }
    
    func audioPlayer(audioPlayer: STKAudioPlayer, didFinishBufferingSourceWithQueueItemId queueItemId: NSObject) {
        playerData!.playerState = .Disposed
    }
    
    func audioPlayer(audioPlayer: STKAudioPlayer, didFinishPlayingQueueItemId queueItemId: NSObject, withReason stopReason: STKAudioPlayerStopReason, andProgress progress: Double, andDuration duration: Double) {
        playerData!.playerState = .Disposed
    }
    
    func audioPlayer(audioPlayer: STKAudioPlayer, unexpectedError errorCode: STKAudioPlayerErrorCode) {
        playerData!.playerState = .Error
    }
    
    func audioPlayer(audioPlayer: STKAudioPlayer, stateChanged state: STKAudioPlayerState, previousState: STKAudioPlayerState) {
    
        if (state == .Paused) {
            playerData!.playerState = .Paused
        }

    }
}