//
//  PALiveViewController.swift
//  PlayAir
//
//  Created by Aymen on 14/02/2016.
//  Copyright © 2016 Farrah. All rights reserved.
//

import StreamingKit
import LGAudioStreamHelper
import UIKit

class PALiveViewController: PAViewController, STKAudioPlayerDelegate {
    
    /*
    audioPlayer = [[STKAudioPlayer alloc] initWithOptions:(STKAudioPlayerOptions){ .flushQueueOnSeek = YES, .enableVolumeMixer = NO, .equalizerBandFrequencies = {50, 100, 200, 400, 800, 1600, 2600, 16000} }];
    */
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    
    @IBAction func onPlayCLick(sender: AnyObject) {
        
        let itemId = "id"
        
        let audioPlayer: STKAudioPlayer = STKAudioPlayer()
        audioPlayer.delegate = self
        audioPlayer.volume = 1
        audioPlayer.meteringEnabled = true
        
        let url = NSURL(string: "http://tropiquesfm.scdn.arkena.com/live.mp3")
        let dataSource = STKAudioPlayer.dataSourceFromURL(url!)
        audioPlayer.setDataSource(dataSource, withQueueItemId: itemId)
                
        let helper = LGAudioStreamMetadataGetter()
        helper.getMetadataFromUrl(url) { (dict:[NSObject : AnyObject]!, response:NSHTTPURLResponse!, error:NSError!) -> Void in
            print("***********************************")
            print("dict")
            print(dict)
            print("***********************************")
            print("response")
            print(response)
        }
        

        
    }
    
    //DELEGATE
    func audioPlayer(audioPlayer: STKAudioPlayer, didStartPlayingQueueItemId queueItemId: NSObject) {
        print("didStartPlayingQueueItemId")
    }

    func audioPlayer(audioPlayer: STKAudioPlayer, didFinishBufferingSourceWithQueueItemId queueItemId: NSObject) {
        print("didFinishBufferingSourceWithQueueItemId")
    }
    
    func audioPlayer(audioPlayer: STKAudioPlayer, didFinishPlayingQueueItemId queueItemId: NSObject, withReason stopReason: STKAudioPlayerStopReason, andProgress progress: Double, andDuration duration: Double) {
        print("didFinishPlayingQueueItemId")
    }
    
    func audioPlayer(audioPlayer: STKAudioPlayer, unexpectedError errorCode: STKAudioPlayerErrorCode) {
        print("unexpectedError")
    }
    
    func audioPlayer(audioPlayer: STKAudioPlayer, stateChanged state: STKAudioPlayerState, previousState: STKAudioPlayerState) {
        print("stateChanged")
    }
    
    

}


