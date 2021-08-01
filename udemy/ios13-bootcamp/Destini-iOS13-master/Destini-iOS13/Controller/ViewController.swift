//
//  ViewController.swift
//  Destini-iOS13
//
//  Created by Angela Yu on 08/08/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var storyLabel: UILabel!
    @IBOutlet weak var choice1Button: UIButton!
    @IBOutlet weak var choice2Button: UIButton!
    
    var adventure = StoryBrain()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateUI()
    }

    @IBAction func choiceMade(_ sender: UIButton) {
        do {
            try adventure.advanceStory(choice: sender.currentTitle)
        } catch {
            // Do something to update the UI
            let alert = UIAlertController(title: "Something Happened", message: "Cannot Continue.", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(alert, animated: true, completion: {})
            return
        }
        
        updateUI()
    }
    
    func updateUI() {
        storyLabel.text = adventure.stories[adventure.currentStoryIndex].title
        choice1Button.setTitle(adventure.stories[adventure.currentStoryIndex].choice1, for: .normal)
        choice2Button.setTitle(adventure.stories[adventure.currentStoryIndex].choice2, for: .normal)
    }
    
}

