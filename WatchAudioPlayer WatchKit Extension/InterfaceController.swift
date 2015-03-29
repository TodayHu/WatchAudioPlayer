//
//  InterfaceController.swift
//  Watch Navigation Ex WatchKit Extension
//
//  Created by Soojin Ro on 3/6/15.
//  Copyright (c) 2015 NSoojin. All rights reserved.
//

import WatchKit
import Foundation
import AVFoundation

class InterfaceController: WKInterfaceController {
    
    var audioPlayer = AVAudioPlayer()
    
    @IBAction func playButtonPressed() {
        audioPlayer.play()
    }
    
    @IBAction func pauseButtonPressed() {
        audioPlayer.pause()
    }
    
    @IBAction func stopButtonPressed() {
        audioPlayer.stop();
        audioPlayer.currentTime = 0
    }
    @IBAction func volumeChanged(value: Float) {
        audioPlayer.volume = value / 100.0
    }
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
        // Configure interface objects here.
        var soundPath = NSBundle.mainBundle().pathForResource("John Legend-All Of Me", ofType: "mp3")
        var soundPathURL = NSURL(fileURLWithPath: soundPath!)
        
        var error:NSError?
        audioPlayer = AVAudioPlayer(contentsOfURL: soundPathURL!, error: &error)
        audioPlayer.prepareToPlay()
        audioPlayer.volume = 0.5
    }
    
    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }
    
    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        
        super.didDeactivate()
    }
    
}
