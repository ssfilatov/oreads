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

    @IBOutlet weak var play: UIButton!
    @IBOutlet weak var Pause: UIButton!
    
    var player: AVPlayer?
    var audioUrl: String?
    var isAudioPlaying: Bool?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        play.setImage(UIImage(named:"play.png"),for:.normal)
        isAudioPlaying = false
        audioUrl = "https://hb.bizmrg.com/oreads/Mythos%20(Unabridged).m4b"
        player = AVPlayer(url: URL.init(string: audioUrl!)!)
    }
    
    @IBAction func play(_ playBtn: UIButton) {
        if !isAudioPlaying! {
            player!.play()
            isAudioPlaying = true
            playBtn.setImage(UIImage(named:"pause.png"),for:.normal)
            playBtn.setImage(UIImage(named:"pause.png"),for:.highlighted)
        } else {
            player!.pause()
            isAudioPlaying = false
            playBtn.setImage(UIImage(named:"play.png"),for:.normal)
            playBtn.setImage(UIImage(named:"pause.png"),for:.highlighted)
        }
    }

}

