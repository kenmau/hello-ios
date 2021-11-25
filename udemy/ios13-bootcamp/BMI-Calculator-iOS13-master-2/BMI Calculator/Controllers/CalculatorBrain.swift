//
//  CalculatorBrain.swift
//  BMI Calculator
//
//  Created by Ken Mau on 2021-11-24.
//  Copyright © 2021 Angela Yu. All rights reserved.
//

import Foundation

struct CalculatorBrain {
    
    // must have a value
    var bmi: Double?
    
    // This struct will be destroyed and recreated when this function is called
    mutating func calculateBMI(height: Double, weight: Double) {
        bmi = weight / pow(height, 2)
    }
    
    func getBMIValue() -> String {
        return String(format: "%.1f", bmi ?? 0.0)
    }
}
