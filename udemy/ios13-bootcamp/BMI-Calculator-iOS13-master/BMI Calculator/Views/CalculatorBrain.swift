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
        bmi = BMI(value: bmiValue, advice: getAdviceString(), color: getColor())
        return bmi?.value ?? 0.0
    }

    func getBMIValue() -> Float {
        return bmi?.value ?? 0.0
    }
    
    func getBMIAdvice() -> String {
        return bmi?.advice ?? "No Advice"
    }
    
    func getBMIColor() -> UIColor {
        return bmi?.color ?? #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
    }
    
    func getAdviceString() -> String {
        switch bmi?.value ?? 0.0 {
        case ..<18.5:
            return "Eat more pies!"
        case 18.5...24.9:
            return "Fit as a fiddle!"
        default:
            return "Eat less pies!"
        }
    }

    func getColor() -> UIColor {
        switch bmi?.value ?? 0.0 {
        case ..<18.5:
            return #colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1)
        case 18.5...24.9:
            return #colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1)
        default:
            return #colorLiteral(red: 0.721568644, green: 0.8862745166, blue: 0.5921568871, alpha: 1)
        }
    }
}
