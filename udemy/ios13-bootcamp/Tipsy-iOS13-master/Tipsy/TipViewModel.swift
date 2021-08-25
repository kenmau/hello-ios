//
//  TipViewModel.swift
//  Tipsy
//
//  Created by Ken Mau on 2021-08-25.
//  Copyright © 2021 The App Brewery. All rights reserved.
//

import Foundation

struct TipViewModel {
    
    func calculateTip(total: Double, percent: Double) -> Double {
        return total * percent
    }
    
    func tipPercent(fromString tipString: String?) -> Double? {
        switch tipString {
        case "0%":
            return 0.0
        case "10%":
            return 0.1
        case "20%":
            return 0.2
        default:
            return nil
        }
    }
}
