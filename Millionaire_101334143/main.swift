//
//  main.swift
//  Millionaire_101334143
//
//  Created by Pinal Patel on 2020-11-03.
//

import Foundation

print("Please Enter your name")
   let nm:String? = readLine()

var player:Player = Player()
    if let name = nm
    {
        if name == "" {
            print("**************************************")
            print("WELCOME USER to the Millionaire Game.")
            print("**************************************")
        }else{
            player = Player(playername: name)
        print("**************************************")
            print("WELCOME \(player.displayPlayerName()) to the Millionaire Game.")
        print("**************************************")
        }
    }
    else{
        print("You didn't enter your name.")
    }

var isOptionSelected = false
var totalQuesDisplay = 0
var gameOption:String?
repeat{
print("\nPlease Choose Your Game Option ")
print("1. Easy Difficulty Level")
print("2. Hard Difficulty Level")
gameOption = readLine()

if (gameOption != ""){
if let selectedOption = gameOption{
        switch selectedOption {
        case "1":
            print("You select Easy Difficulty Level...")
            isOptionSelected = true
            totalQuesDisplay = 9
            let questionList = addEasyQuestions()
            let easy = HangmanGameQuestion(dollar: [100,500,1000,8000,16000,32000,125000,500000,1000000], questionList: questionList,player: player)
          
            easy.displayRandomQuestion(totalQuesDisplay:totalQuesDisplay,gameOption: selectedOption)

        case "2":
            print("You select Hard Difficulty Level...")
            isOptionSelected = true
            totalQuesDisplay = 15
            let questionList = addDiffiQuestions()
            let difficult = HangmanGameQuestion(dollar: [100,200,300,500,1000,2000,4000,8000,16000,32000,64000,125000,250000,500000,1000000],questionList: questionList,player: player)

            difficult.displayRandomQuestion(totalQuesDisplay:totalQuesDisplay,gameOption:selectedOption)
        default:
            print("You didn't choose the valid option.")
        
    }
}
}else{
    print("Please choose any option from below.")
}
}
while (!isOptionSelected)

func addEasyQuestions() -> [QuestionBank]{

    let eQuestion1:QuestionBank = QuestionBank(question: "In what units is the pressure measured?",answer: ["A: Pascals", "B: Watts", "C: Volts", "D: Degree Celsius"],correctAns: 0)

    let eQuestion2:QuestionBank = QuestionBank(question: "How many players are on the field in a volleyball team?",answer: ["A: 7", "B: 5","C: 4","D: 6"],correctAns: 3)
    
    let eQuestion3:QuestionBank = QuestionBank(question: "Which sport is played with a shuttlecock?",answer: ["A: Football", "B: Tennis","C: Hockey","D: Badminton"],correctAns: 3)
    
    let eQuestion4:QuestionBank = QuestionBank(question: "Where does the sun set?",answer: ["A: In the east", "B: In the west","C: In the north","D: In the south"],correctAns: 1)

    let eQuestion5:QuestionBank = QuestionBank(question: "How many times greater is the unit with the prefix mega?",answer: ["A: 100,000x", "B: 10,000x","C: 1,000x","D: 1,000,000x"],correctAns: 3)
    
    let eQuestion6:QuestionBank = QuestionBank(question: "How many bones are there in human body?",answer: ["A: 168", "B: 206","C: 125","D: 293"],correctAns: 1)
    
    let eQuestion7:QuestionBank = QuestionBank(question: "How many seconds are in a minute?",answer: ["A: 30", "B: 1","C: 60","D: 500"],correctAns: 2)
    
    let eQuestion8:QuestionBank = QuestionBank(question: "What makeup product makes eyelashes appear longer?",answer: ["A: Mascara", "B: Blush","C: Lipstick","D: Foundation"],correctAns: 0)
    
    let eQuestion9:QuestionBank = QuestionBank(question: "What city contains the Eiffel Tower?",answer: ["A: Sydney", "B: Los Angeles","C: New York City","D: Paris"],correctAns: 3)
    
    var easyBank : [QuestionBank] = [QuestionBank]()
    easyBank.append(eQuestion1)
    easyBank.append(eQuestion2)
    easyBank.append(eQuestion3)
    easyBank.append(eQuestion4)
    easyBank.append(eQuestion5)
    easyBank.append(eQuestion6)
    easyBank.append(eQuestion7)
    easyBank.append(eQuestion8)
    easyBank.append(eQuestion9)

    return easyBank
}

func addDiffiQuestions() -> [QuestionBank] {
let dQuestion1:QuestionBank = QuestionBank(question: "In which century was the Second World War?",answer: ["A: in the 20th", "B: in the 19th ", "C: in the 18th ", "D: in the 17th "],correctAns: 0)

let dQuestion2:QuestionBank = QuestionBank(question: "The Aztec empire was located in?",answer: ["A: In Brazil", "B: In Mexico","C: In Colombia","D: In Peru"],correctAns: 1)

    let dQuestion3:QuestionBank = QuestionBank(question: "Which colour is used as a term to describe an illegal market in rare goods?",answer: ["A: Blue", "B: Red","C: Black","D: White"],correctAns: 2)

    let dQuestion4:QuestionBank = QuestionBank(question: "Which of these would a film actor like to receive?",answer: ["A: Oliver", "B: Oscar","C: Oliphant ","D: Osbert"],correctAns: 1)

    let dQuestion5:QuestionBank = QuestionBank(question: "In which country would you expect to be greeted with the word bonjour?",answer: ["A: Italy", "B: France","C: Spain ","D: Wales"],correctAns: 1)

    let dQuestion6:QuestionBank = QuestionBank(question:"By what alternative name is Manchester International Airport sometimes known?",answer: ["A: Ringmaster", "B: Ringbark","C: Ringway ","D: Ringside"],correctAns: 2)


    let dQuestion7:QuestionBank = QuestionBank(question: "Complete the title of the TV comedy drama, 'Auf Wiedersehen, ...",answer: ["A: Sweetie", "B: Darling","C: Angel ","D: Pet"],correctAns: 3)

    let dQuestion8:QuestionBank = QuestionBank(question: "Which Irish rock band shares its name with an American spy plane?",answer: ["A: U2", "B: SR-71","C: F-111 ","D: C-130"],correctAns: 0)

    let dQuestion9:QuestionBank = QuestionBank(question: "What copy can be said to describe something identical?",answer: ["A: Oxygen", "B: Hydrogen","C: Nitrogen ","D: Carbon"],correctAns: 3)

    let dQuestion10:QuestionBank = QuestionBank(question: "Which of these is a spicy Indian dish?",answer: ["A: Spaghetti", "B: Biriani","C: Bellini","D: Crostini"],correctAns: 1)

    let dQuestion11:QuestionBank = QuestionBank(question: "Which board game is known as 'checkers' in the USA?",answer: ["A: Snakes & ladders", "B: Backgammon","C: Draughts","D: Ludo"],correctAns: 2)

    let dQuestion12:QuestionBank = QuestionBank(question: "Which is not a real English county?",answer: ["A: West Sussex", "B: South Norfolk","C: North Yorkshire","D: East Sussex"],correctAns: 1)

    let dQuestion13:QuestionBank = QuestionBank(question: "Which 1969 film won the Best Picture Oscar?",answer: ["A: Midnight Cowboy", "B: Noontime Apache","C: Twilight Cavalry","D: Morning Rancher"],correctAns: 0)

    let dQuestion14:QuestionBank = QuestionBank(question: "Which of these is a common term for a programme of physical exercises?",answer: ["A: Stay able", "B: Remain trim","C: Continue competent","D: Keep fit"],correctAns: 3)

    let dQuestion15:QuestionBank = QuestionBank(question: "Which famous cricketer was given a twelve-month ban in February 2003?",answer: ["A: Shane Fenton", "B: Shane MacGowan","C: Shane Warne","D: Shane Richie"],correctAns: 2)



var difficultBank : [QuestionBank] = [QuestionBank]()
    difficultBank.append(dQuestion1)
    difficultBank.append(dQuestion2)
    difficultBank.append(dQuestion3)
    difficultBank.append(dQuestion4)
    difficultBank.append(dQuestion5)
    difficultBank.append(dQuestion6)
    difficultBank.append(dQuestion7)
    difficultBank.append(dQuestion8)
    difficultBank.append(dQuestion9)
    difficultBank.append(dQuestion10)
    difficultBank.append(dQuestion11)
    difficultBank.append(dQuestion12)
    difficultBank.append(dQuestion13)
    difficultBank.append(dQuestion14)
    difficultBank.append(dQuestion15)

    return difficultBank
}

