//
//  ViewController.swift
//  Empire Radio
//
//  Created by Ryan Ball on 30/03/2018.
//  Copyright © 2018 Ryan Ball. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    var player:AVPlayer?
    var playerItem:AVPlayerItem?
    
    @IBOutlet weak var playButton: UIButton!
    @IBOutlet weak var pauseButton: UIButton!
    @IBOutlet weak var volumeSlider: UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let url = URL(string: "http://139.162.145.171:8010/stream")
        let playerItem:AVPlayerItem = AVPlayerItem(url: url!)
        player = AVPlayer(playerItem: playerItem)
        
    }
    
    @IBAction func playButtonPressed(_ sender: Any) {
        
        playButton.isHidden = true
        pauseButton.isHidden = false
        
        if Reachability.isConnectedToNetwork(){
            
            let url = URL(string: "http://139.162.145.171:8010/stream")
            let playerItem:AVPlayerItem = AVPlayerItem(url: url!)
            player = AVPlayer(playerItem: playerItem)
            
            player!.play()
        }
        else{
            print("Internet Connection not Available!")
            
            let alertController = UIAlertController(title: "No Internet Connection", message: "Make sure your device is connected to the internet.", preferredStyle: .alert)
            
            // Create the actions
            let okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default) {
                UIAlertAction in
                NSLog("OK Pressed")
                
            }
            
            // Add the actions
            alertController.addAction(okAction)
            
            // Present the controller
            self.present(alertController, animated: true, completion: nil)
            
            playButton.isHidden = false
            pauseButton.isHidden = true
        }
        
    }
    
    @IBAction func pauseButtonPressed(_ sender: Any) {
        
        playButton.isHidden = false
        pauseButton.isHidden = true
        
        player!.pause()
        
    }
    
    @IBAction func volumeSliderMoved(_ sender: Any) {
        
        player?.volume = volumeSlider.value
        
    }
    
}

