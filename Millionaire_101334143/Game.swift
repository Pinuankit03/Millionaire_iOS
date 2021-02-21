//
//  Game.swift
//  Millionaire_101334143
//
//  Created by Pinal Patel on 2020-11-06.
//

import Foundation

class Game
{
    var dollar:[Int]
    var questionList:[QuestionBank]
    var player:Player
    
     init(dollar: [Int], questionList: [QuestionBank], player: Player) {
        self.dollar = dollar
        self.questionList = questionList
        self.player = player
    }
}
