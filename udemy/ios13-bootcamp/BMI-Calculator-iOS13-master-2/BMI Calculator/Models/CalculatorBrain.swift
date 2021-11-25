//
//  CalculatorBrain.swift
//  BMI Calculator
//
//  Created by Ken Mau on 2021-11-24.
//  Copyright © 2021 Angela Yu. All rights reserved.
///Users/ken/Development/ios/udemy/bootcamp/udemy/ios13-bootcamp/BMI-Calculator-iOS13-master-2/BMI Calculator/Models

import UIKit

struct CalculatorBrain {
    
    // must have a value
    var bmi: BMI?
    
    func getBMIValue() -> String {
        // If Check
//        if bmi != nil {
//            return String(format: "%.1f", bmi)
//        } else {
//            return "0.0"
//        }
        
        // Optional Binding
//        if let bmi = bmi {
//            return String(format: "%.1f", bmi)
//        } else {
//            return "0.0"
//        }
        
        // Chaining + Nil coalescing
        return String(format: "%.1f", bmi?.value ?? "0.0")
    }
    
    // This struct will be destroyed and recreated when this function is called
    mutating func calculateBMI(height: Double, weight: Double) {
        let bmiValue = weight / pow(height, 2)
//        bmi = BMI(value: bmiValue, advice: <#T##String#>, color: <#T##UIColor#>)
        
        if bmiValue < 18.5 {
            bmi = BMI(value: bmiValue, advice: "Eat more pies", color: .blue)
        } else if bmiValue < 24.9 {
            bmi = BMI(value: bmiValue, advice: "Fit as a fiddle!", color: .green)
        } else {
            bmi = BMI(value: bmiValue, advice: "Eat less pies", color: .red)
        }
    }
    
    func getAdvice() -> String {
        return bmi?.advice ?? "No Advice"
    }
    
    func getColor() -> UIColor {
        return bmi?.color ?? .white
    }
}
