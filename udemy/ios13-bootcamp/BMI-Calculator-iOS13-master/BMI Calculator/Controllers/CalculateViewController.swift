//
//  ViewController.swift
//  BMI Calculator
//
//  Created by Angela Yu on 21/08/2019.
//  Copyright © 2019 Angela Yu. All rights reserved.
//

import UIKit

class CalculateViewController: UIViewController {
    
    var calculatorBrain = CalculatorBrain()

    @IBOutlet weak var heightLabel: UILabel!
    @IBOutlet weak var weightLabel: UILabel!
    @IBOutlet weak var heightSlider: UISlider!
    @IBOutlet weak var weightSlider: UISlider!
   
    
    var bmi: Float? = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        heightSlider.value = 1.5
        weightSlider.value = 100.0
    }

    @IBAction func heightSliderChanged(_ sender: UISlider) {
        print(String(format: "%.2f", sender.value))
        heightLabel.text = String(format: "%.2fm", sender.value)
    }
    
    @IBAction func weightSliderChanged(_ sender: UISlider) {
        print(Int(sender.value))
        weightLabel.text = "\(Int(sender.value))Kg"
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        print(heightSlider.value)
        print(weightSlider.value)
        
        _ = calculatorBrain.calculateBMI(height: heightSlider.value, weight: weightSlider.value)
        
        
        self.performSegue(withIdentifier: "goToResult", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult" {
            
            // downcasting: cast it down to a ResultViewController
            // as! expresses certainty that it's going to
            let destinationVC = segue.destination as! ResultsViewController
            destinationVC.bmiValue = String(format: "%.1f", calculatorBrain.getBMIValue())
        }
    }
}

