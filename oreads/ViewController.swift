//
//  ViewController.swift
//  oreads
//
//  Created by Sergey Filatov on 26/01/2019.
//  Copyright © 2019 Sergey Filatov. All rights reserved.
//

import AVKit
import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var playBtn: UIButton!
    @IBOutlet weak var playbackSlider: UISlider!
    
    var player: AVPlayer?
    var audioUrl: String?
    var isAudioPlaying: Bool?
    var playerDuration: CMTime?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let audioUrl = URL(string: "https://hb.bizmrg.com/oreads/pupa.mp3")
        let playerItem:AVPlayerItem = AVPlayerItem(url: audioUrl!)
        player = AVPlayer(playerItem: playerItem)
        
        playBtn.setImage(UIImage(named:"play.png"),for:.normal)
        playBtn.addTarget(self, action: #selector(ViewController.playButtonTapped(_:)), for: .touchUpInside)
        
        playbackSlider.minimumValue = 0
        let duration : CMTime = playerItem.asset.duration
        let seconds : Float64 = CMTimeGetSeconds(duration)
        playbackSlider!.maximumValue = Float(seconds)
        playbackSlider!.isContinuous = false
        playbackSlider?.addTarget(self, action: #selector(ViewController.playbackSliderValueChanged(_:)), for: .valueChanged)
        
        player!.addPeriodicTimeObserver(forInterval: CMTimeMakeWithSeconds(1, preferredTimescale: 1), queue: DispatchQueue.main) { (CMTime) -> Void in
            if self.player!.currentItem?.status == .readyToPlay {
                let time : Float64 = CMTimeGetSeconds(self.player!.currentTime());
                self.playbackSlider!.value = Float ( time );
            }
        }
    }
    
    @objc func playbackSliderValueChanged(_ playbackSlider:UISlider)
    {
        
        let seconds : Int64 = Int64(playbackSlider.value)
        let targetTime:CMTime = CMTimeMake(value: seconds, timescale: 1)
        
        player!.seek(to: targetTime)
        
        if player!.rate == 0
        {
            player?.play()
        }
    }
    
    @objc func playButtonTapped(_ sender:UIButton)
    {
        if player?.rate == 0
        {
            player!.play()
            playBtn.setImage(UIImage(named:"pause.png"),for:.normal)
        } else {
            player!.pause()
            playBtn.setImage(UIImage(named:"play.png"),for:.normal)
        }
    }

}

