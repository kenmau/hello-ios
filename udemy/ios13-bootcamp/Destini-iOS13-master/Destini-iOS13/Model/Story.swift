//
//  Sotry.swift
//  Destini-iOS13
//
//  Created by Angela Yu on 08/08/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import Foundation

struct Story {
    let title: String
    let choice1: String
    let choice2: String
    let choice1Destination: Int
    let choice2Destination: Int
    
    init(title t: String, choice1 c1: String, choice1Destination c1d: Int, choice2 c2: String, choice2Destination c2d: Int) {
        title = t
        choice1 = c1
        choice1Destination = c1d
        choice2 = c2
        choice2Destination = c2d
    }
}
