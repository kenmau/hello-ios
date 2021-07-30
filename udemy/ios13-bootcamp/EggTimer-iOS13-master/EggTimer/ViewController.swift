//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var totalTime: Int = 0

    @IBAction func hardnessSelected(_ sender: UIButton) {
        let hardness = sender.currentTitle!
        
        let eggTimes = ["Soft": 300, "Medium": 420, "Hard": 720, "Default" : 0]
        print(eggTimes[hardness]!)
        
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
        
        totalTime = eggTimes[hardness] ?? 0
        
        Timer.scheduledTimer(withTimeInterval: 1, repeats: true, block: { timer in
            if self.totalTime >= 0 {
                print("\(self.totalTime) seconds.")
            } else {
                timer.invalidate()
            }
            self.totalTime -= 1
        })
    }
}
