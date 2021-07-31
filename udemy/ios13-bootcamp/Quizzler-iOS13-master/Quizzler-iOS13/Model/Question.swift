//
//  Question.swift
//  Quizzler-iOS13
//
//  Created by Ken Mau on 2021-07-31.
//  Copyright © 2021 The App Brewery. All rights reserved.
//

import Foundation

struct Question {
    let text: String
    let answer: [String]
    let correctAnswer: String
    
    init(q: String, a: [String], correctAnswer c: String) {
        text = q
        answer = a
        correctAnswer = c
    }
}
