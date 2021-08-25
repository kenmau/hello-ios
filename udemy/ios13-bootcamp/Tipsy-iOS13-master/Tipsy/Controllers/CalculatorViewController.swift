//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {

    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var zeroPctButton: UIButton!
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var twentyPctButton: UIButton!
    @IBOutlet weak var splitNumberLabel: UILabel!
    
    var tipPercent: Double?
    let tip = TipViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.hideKeyboardWhenTappedAround()
        
        tipChanged(tenPctButton)
    }
    
    func resetPctButtons() {
        zeroPctButton.isSelected = false
        tenPctButton.isSelected = false
        twentyPctButton.isSelected = false
    }

    @IBAction func tipChanged(_ sender: UIButton) {
        resetPctButtons()
        sender.isSelected = true
        tipPercent = tip.tipPercent(fromString: sender.currentTitle)
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
    }
    
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        let billValue = Double(billTextField.text!)
        let tip = tip.calculateTip(total: billValue ?? 0.0, percent: tipPercent ?? 0.0)
        print(String(format: "Tip is %.2f", tip))
    }
}

