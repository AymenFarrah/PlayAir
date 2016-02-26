//
//  PAMusicPlayerViewController.swift
//  PlayAir
//
//  Created by Aymen on 21/02/2016.
//  Copyright © 2016 Farrah. All rights reserved.
//

import Foundation
import KVOController

class PAMusicPlayerViewController: PAViewController {
    
    @IBOutlet weak var albumImageLeftConstraint: NSLayoutConstraint?
    @IBOutlet weak var albumImageRightConstraint: NSLayoutConstraint?
    
    @IBOutlet weak var backgroudImageView: UIImageView?
    @IBOutlet weak var backgroudView: UIView?
    @IBOutlet weak var albumImageView: UIImageView?
    
    @IBOutlet weak var musicNameLabel: UILabel?
    @IBOutlet weak var singerLabel: UILabel?
    @IBOutlet weak var beginTimeLabel: UILabel?
    @IBOutlet weak var endTimeLabel: UILabel?
    @IBOutlet weak var musicTitleLabel: UILabel?
    
    @IBOutlet weak var musicMenuButton: UIButton?
    @IBOutlet weak var favoriteButton: UIButton?
    @IBOutlet weak var previousMusicButton: UIButton?
    @IBOutlet weak var nextMusicButton: UIButton?
    @IBOutlet weak var musicToggleButton: UIButton?
    @IBOutlet weak var musicCycleButton: UIButton?
    
    var visualEffectView: UIVisualEffectView?
    var radio: PARadio?
 
    override func viewDidLoad() {
        super.viewDidLoad()
        pageName = "musicPlayer"
        addPanRecognizer()
        
        PAPlayerManager.sharedManager().initDatafNecessary()
        
        KVOControllerNonRetaining.observe(
            PAPlayerManager.sharedManager().playerData,
            keyPath: "playerState",
            options: [.Old,.New],
            action: "updateState")
        
        
    }
    
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        //updateBackground()
        PAPlayerManager.sharedManager().play(radio!)
        
    }
    
    override func viewDidDisappear(animated: Bool) {
        super.viewDidDisappear(animated)        
        //PAPlayerManager.sharedManager().stop()
        
    }
    
    deinit {
        KVOControllerNonRetaining.unobserveAll()
    }
    

    func updateState() {
        print("updated")
        
        musicNameLabel?.text = radio?.name
        singerLabel?.text = PAPlayerManager.sharedManager().playerData?.songTitle
        
        let imageName = PAPlayerManager.sharedManager().currentRadio?.picto
        albumImageView?.image = UIImage(named: imageName!)
    }
    
    // MARK: Utils
    func addPanRecognizer()
    {
        let swipe = UISwipeGestureRecognizer(target: self, action: Selector("didTouchDismissButton:"))
        swipe.direction = .Down
        view.addGestureRecognizer(swipe)
    }
    
    // MARK: Audio
    func playStream () {
        
    }
    

    func updateBackground () {
        
        albumImageView?.layer.cornerRadius = 7
        albumImageView?.layer.masksToBounds = true
        
        
        let isDescendant = (visualEffectView?.isDescendantOfView(backgroudView!))! as Bool
        if isDescendant {
            let blurEffect = UIBlurEffect(style: .Light)
            visualEffectView = UIVisualEffectView(effect: blurEffect)
            visualEffectView?.frame = view.frame
            
            /*
            [_backgroudImageView sd_setImageWithURL:imageUrl placeholderImage:[UIImage imageNamed:@"music_placeholder"]];
            [_albumImageView sd_setImageWithURL:imageUrl placeholderImage:[UIImage imageNamed:@"music_placeholder"]];
            */
            
            backgroudView!.addSubview(visualEffectView!)
            backgroudView?.startTransitionAnimation()
            
            /*
            [_backgroudImageView startTransitionAnimation];
            [_albumImageView startTransitionAnimation];
            */
        }
    }

    
    // MARK: IBAction
    @IBAction func playNextMusic(sender: AnyObject) {
        /*
        if (_musicEntities.count == 1) {
        [self showMiddleHint:@"已经是最后一首歌曲"];
        return;
        }
        if (_musicCycleType == MusicCycleTypeShuffle && _musicEntities.count > 2) {
        [self setupRandomMusicIfNeed];
        } else {
        [self checkNextIndexValue];
        }
        
        [self setupStreamer];
        */
    }
    
    @IBAction func didTouchMoreButton(sender: AnyObject) {
        //_dontReloadMusic = YES;
    }

    
    @IBAction func didTouchMenuButton(sender: AnyObject) {
        //_dontReloadMusic = YES;
    }

    @IBAction func didTouchDismissButton(sender: AnyObject) {
        
        
        self.dismissViewControllerAnimated(true, completion: nil)
        
        /*
        __weak typeof(self) weakSelf = self;
        [self.navigationController dismissViewControllerAnimated:YES completion:^{
        weakSelf.dontReloadMusic = NO;
        weakSelf.lastMusicUrl = [weakSelf currentPlayingMusic].musicUrl.mutableCopy;
        }];
        */
    }

    @IBAction func didTouchFavoriteButton(sender: AnyObject) {
        
        favoriteButton?.startDuangAnimation()
        
        if (radio!.isFavorite == true) {
            favoriteButton?.setImage(UIImage(named: "empty_heart"), forState: .Normal)
        } else {
            favoriteButton?.setImage(UIImage(named: "red_heart"), forState: .Normal)
        }
        
        /*
        [_favoriteButton startDuangAnimation];
        if ([self hasBeenFavoriteMusic]) {
        [self unfavoriteMusic];
        } else {
        [self favoriteMusic];
        }

        */
    }
    
    
    @IBAction func didTouchMusicCycleButton(sender: AnyObject) {
        /*
        switch (_musicCycleType) {
        case MusicCycleTypeLoopAll: {
        self.musicCycleType = MusicCycleTypeShuffle;
        [self showMiddleHint:@"随机播放"]; } break;
        case MusicCycleTypeShuffle: {
        self.musicCycleType = MusicCycleTypeLoopSingle;
        [self showMiddleHint:@"单曲循环"]; } break;
        case MusicCycleTypeLoopSingle: {
        self.musicCycleType = MusicCycleTypeLoopAll;
        [self showMiddleHint:@"列表循环"]; } break;
        
        default:
        break;
        }

        */
    }
    
    
    @IBAction func didTouchMusicToggleButton(sender: AnyObject) {
        /*
        if (_musicIsPlaying) {
        [_streamer pause];
        } else {
        [_streamer play];
        }
        */
    }
    
    @IBAction func didChangeMusicSliderValue(sender: AnyObject) {
        /*
        if (_streamer.status == DOUAudioStreamerFinished) {
        _streamer = nil;
        [self createStreamer];
        }
        
        [_streamer setCurrentTime:[_streamer duration] * _musicSlider.value];
        [self updateProgressLabelValue];
        */
    }
    
    @IBAction func playPreviousMusic(sender: AnyObject) {
        /*
        if (_musicEntities.count == 1) {
        [self showMiddleHint:@"已经是第一首歌曲"];
        return;
        }
        if (_musicCycleType == MusicCycleTypeShuffle && _musicEntities.count > 2) {
        [self setupRandomMusicIfNeed];
        } else {
        NSInteger firstIndex = 0;
        if (_currentIndex == firstIndex || [self currentIndexIsInvalid]) {
        self.currentIndex = _musicEntities.count - 1;
        } else {
        self.currentIndex--;
        }
        }
        
        [self setupStreamer];

        */
    }
/*

    
*/
    
    
}