//
//  QuestionBank.swift
//  Millionaire_101334143
//
//  Created by Pinal Patel on 2020-11-05.
//

import Foundation

class QuestionBank
{
    let question:String
    let answer:[String]
    let correctAns:Int
    
         init(question:String,answer:[String], correctAns : Int) {
            self.question = question;
            self.answer = answer
            self.correctAns = correctAns
        }
    
}


