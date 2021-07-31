//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    var totalTime: Float = 0.0
    var timeElapsed: Float = 0.0
    var timer = Timer()
    var player: AVAudioPlayer!

    @IBOutlet weak var timerLabel: UILabel!
    @IBOutlet weak var timerProgress: UIProgressView!
    
    override func viewDidLoad() {
        self.timerProgress.setProgress(0.0, animated: true)
    }
    
    @IBAction func hardnessSelected(_ sender: UIButton) {
        let hardness = sender.currentTitle!
        
        timer.invalidate()
        timerProgress.progress = 0.0
        timeElapsed = 0
        
        let eggTimes: [String: Float] = ["Soft": 3.0, "Medium": 420.0, "Hard": 720.0, "Default" : 0.0]
        print(eggTimes[hardness]!)
        timerLabel.text = hardness
        
//        switch hardness {
//        case "Soft":
//            print(softTime)
//        case "Medium":
//            print(mediumTime)
//        case "Hard":
//            print(hardTime)
//        default:
//            print("Unknown Hardness")
//        }
        
        totalTime = eggTimes[hardness] ?? 0.0
        
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true, block: { timer in
            if self.timeElapsed <= self.totalTime {
                DispatchQueue.main.async {
                    print(self.timeElapsed/self.totalTime)
                    self.timerProgress.setProgress(self.timeElapsed/self.totalTime, animated: true)
                }
                self.timeElapsed += 1
            } else {
                self.timerLabel.text = "Done!"
                timer.invalidate()
                self.playSound()
            }
        })
    }
    
    func playSound() {
        let url = Bundle.main.url(forResource: "alarm_sound", withExtension: "mp3")
        player = try! AVAudioPlayer(contentsOf: url!)
        player.play()
    }
}
