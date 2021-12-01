//
//  TipViewModel.swift
//  Tipsy
//
//  Created by Ken Mau on 2021-11-30.
//  Copyright © 2021 The App Brewery. All rights reserved.
//

import Foundation

struct TipViewModel {
    var tip: TipModel?
    
    mutating func calculateTip(withTotal billTotal: Double, for numberOfPeople: Int, withTipPct percentage: Double) {
        let amountOwedPerPerson: Double = billTotal * (1 + percentage) / Double(numberOfPeople)
        
        tip = TipModel(totalPerPerson: amountOwedPerPerson, tipPercentage: percentage, numberOfPeople: numberOfPeople)
    }
    
    func getAmountOwedPerPerson() -> Double {
        return tip?.totalPerPerson ?? 0.0
    }
    
    func getNumberOfPeople() -> Int {
        return tip?.numberOfPeople ?? 0
    }
    
    func getTipPercentage() -> Double {
        return (tip?.tipPercentage ?? 0.0) * 100
    }
}
