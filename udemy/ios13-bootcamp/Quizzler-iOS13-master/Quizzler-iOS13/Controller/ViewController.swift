//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Angela Yu on 12/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var aButton: UIButton!
    @IBOutlet weak var bButton: UIButton!
    @IBOutlet weak var cButton: UIButton!
    @IBOutlet weak var scoreLabel: UILabel!
    
    // creates copy of the struct
    var quizBrain = QuizBrain()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        updateUI()
    }

    @IBAction func actionButtonPressed(_ sender: UIButton) {
        let userAnswer = sender.currentTitle! // True, False
        
        if quizBrain.checkAnswer(userAnswer) {
            // Got it right
            sender.backgroundColor = UIColor.green
        } else {
            sender.backgroundColor = UIColor.red
        }
        
        quizBrain.nextQuestion()

        Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
        
    }
    
    @objc func updateUI() {
        questionLabel.text = quizBrain.getQuestionText()
        let answers = quizBrain.getAnswers()
        
        aButton.setTitle(answers[0], for: .normal)
        bButton.setTitle(answers[1], for: .normal)
        cButton.setTitle(answers[2], for: .normal)
        self.aButton.backgroundColor = UIColor.clear
        self.bButton.backgroundColor = UIColor.clear
        self.cButton.backgroundColor = UIColor.clear
        
        progressBar.progress = quizBrain.getProgress()
        
        scoreLabel.text = "Score: \(quizBrain.getScore())"
        
    }
    
}

