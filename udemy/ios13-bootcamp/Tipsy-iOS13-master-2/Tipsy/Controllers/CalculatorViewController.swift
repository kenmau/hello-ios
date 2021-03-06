//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {
    var tipViewModel = TipViewModel()
    
    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var zeroPctButton: UIButton!
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var twentyPctButton: UIButton!
    @IBOutlet weak var splitNumberLabel: UILabel!
    
    var tipSelected: Double = 0.1
    var splitNumber: Int = 2

    @IBAction func tipChanged(_ sender: UIButton) {
        // Clear all selected bttons
        zeroPctButton.isSelected = false
        tenPctButton.isSelected = false
        twentyPctButton.isSelected = false
        
        if sender.titleLabel?.text == "0%" {
            zeroPctButton.isSelected = true
            tipSelected = 0
        } else if sender.titleLabel?.text == "10%" {
            tenPctButton.isSelected = true
            tipSelected = 0.1
        } else {
            twentyPctButton.isSelected = true
            tipSelected = 0.2
        }
        
        billTextField.endEditing(true)
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        splitNumberLabel.text = String(format: "%.0f", sender.value)
        splitNumber = Int(sender.value)
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        let billTotal: Double = Double(billTextField.text ?? "") ?? 0
        
        tipViewModel.calculateTip(withTotal: billTotal, for: splitNumber, withTipPct: tipSelected)
        
        performSegue(withIdentifier: "calculateToResults", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "calculateToResults" {
            let destinationVC = segue.destination as! ResultsViewController
            
            destinationVC.totalPerPerson = tipViewModel.getAmountOwedPerPerson()
            destinationVC.numberOfPeople = tipViewModel.getNumberOfPeople()
            destinationVC.tipPercentage = tipViewModel.getTipPercentage()
        }
    }
}

