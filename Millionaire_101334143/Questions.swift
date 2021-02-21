//
//  Questions.swift
//  Millionaire_101334143
//
//  Created by Pinal Patel on 2020-11-04.
//

import Foundation
struct Questions{
    let question:String
    let answer :[Answer]
    
    // initializers
    init(question:String, answer:[Answer]) {
        self.question = question
        self.answer = answer
    }
}
struct Answer{
    
    let answer : String
    let isCorrect : Bool
}


