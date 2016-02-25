//
//  PAPlayerManager.swift
//  PlayAir
//
//  Created by Aymen on 14/02/2016.
//  Copyright © 2016 Farrah. All rights reserved.
//

import Foundation
import StreamingKit



class PAPlayerManager: NSObject, STKAudioPlayerDelegate {

    
    enum ManagerPlayerState {
        case Ready
        case Running
        case Playing
        case Buffering
        case Paused
        case Stopped
        case Error
        case Disposed
    }
    
    static let sharedInstance = PAPlayerManager()
    private let player: STKAudioPlayer = STKAudioPlayer()
    var playerState = .Ready as ManagerPlayerState
    
    
    override init() {
        super.init()
        
        self.player.delegate = self
        self.player.volume = 1
        self.player.meteringEnabled = true
    }
    
    
    func play(url: String) {
        let url = NSURL(string: url)
        let itemId = url
        let dataSource = STKAudioPlayer.dataSourceFromURL(url!)
        player.setDataSource(dataSource, withQueueItemId: itemId!)
    }
    
    
    // MARK: DELEGATE
    func audioPlayer(audioPlayer: STKAudioPlayer, didStartPlayingQueueItemId queueItemId: NSObject) {
        print("didStartPlayingQueueItemId")
        playerState = .Playing
    }
    
    func audioPlayer(audioPlayer: STKAudioPlayer, didFinishBufferingSourceWithQueueItemId queueItemId: NSObject) {
        print("didFinishBufferingSourceWithQueueItemId")
        playerState = .Disposed
    }
    
    func audioPlayer(audioPlayer: STKAudioPlayer, didFinishPlayingQueueItemId queueItemId: NSObject, withReason stopReason: STKAudioPlayerStopReason, andProgress progress: Double, andDuration duration: Double) {
        print("didFinishPlayingQueueItemId")
        playerState = .Disposed
    }
    
    func audioPlayer(audioPlayer: STKAudioPlayer, unexpectedError errorCode: STKAudioPlayerErrorCode) {
        print("unexpectedError")
        playerState = .Error
    }
    
    func audioPlayer(audioPlayer: STKAudioPlayer, stateChanged state: STKAudioPlayerState, previousState: STKAudioPlayerState) {
        print("stateChanged")
        
        if (state == .Playing) {
            playerState = .Playing
        }
        
        if (state == .Paused) {
            playerState = .Paused
        }

    }
    
    
    /*
    let audioPlayer: STKAudioPlayer = STKAudioPlayer()
    audioPlayer.delegate = self
    audioPlayer.volume = 1
    audioPlayer.meteringEnabled = true
    */
    
    /*
    let options = STKAudioPlayerOptions(flushQueueOnSeek: true, enableVolumeMixer: false, equalizerBandFrequencies: (0.33333), readBufferSize: 0, bufferSizeInSeconds: 0, secondsRequiredToStartPlaying: 0, gracePeriodAfterSeekInSeconds: 0, secondsRequiredToStartPlayingAfterBufferUnderun: 0)

    var audioPlayer = STKAudioPlayer(options: options)
    */
}