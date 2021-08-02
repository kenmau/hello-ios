//
//  CalculatorBrain.swift
//  BMI Calculator
//
//  Created by Ken Mau on 2021-08-02.
//  Copyright © 2021 Angela Yu. All rights reserved.
//

import UIKit

struct CalculatorBrain {
    
    var bmi: BMI?
    
    mutating func calculateBMI(height: Float, weight: Float) -> Float {
        let bmiValue = weight / pow(height, 2)
        bmi = BMI(value: bmiValue, advice: "", color: UIColor.clear)
        return bmi?.value ?? 0.0
    }

    func getBMIValue() -> Float {
        return bmi?.value ?? 0.0
    }
    
    func getAdvice() -> String {
        switch bmi?.value ?? 0.0 {
        case ..<18.5:
            return "Underweight"
        case 18.5...24.9:
            return "Normal"
        default:
            return "Overweight"
        }
    
    }
}
