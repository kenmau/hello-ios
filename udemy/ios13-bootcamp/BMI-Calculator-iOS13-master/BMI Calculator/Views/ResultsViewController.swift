//
//  ResultsViewController.swift
//  BMI Calculator
//
//  Created by Ken Mau on 2021-08-01.
//  Copyright © 2021 Angela Yu. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {
    
    var bmiValue: String?
    var adviceValue: String?
    var color: UIColor?

    @IBOutlet weak var bmiLabel: UILabel?
    @IBOutlet weak var adviceLabel: UILabel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        bmiLabel?.text = bmiValue ?? "0.0"
        adviceLabel?.text = adviceValue ?? "No Advice"
        self.view.backgroundColor = color ?? #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)

        // Do any additional setup after loading the view.
    }
    

    @IBAction func recalculatePressed(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
}
