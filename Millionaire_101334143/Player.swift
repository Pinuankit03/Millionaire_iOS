//
//  Player.swift
//  Millionaire_101334143
//
//  Created by Pinal Patel on 2020-11-12.
//

import Foundation

class Player{
    
    var playername:String = ""
    
    init(playername: String) {
       self.playername = playername
   }
    
    init(){}
   
    func displayPlayerName() -> String{
        
        return self.playername
    }
    
    
}
