//
//  EasyQuestionBank.swift
//  Millionaire_101334143
//
//  Created by Pinal Patel on 2020-11-05.

import Foundation

class HangmanGameQuestion: Game {
    
    enum LifeLine:String{
            case fiftyfifty = "1.50:50"
            case audience = "2.Ask the Audience"
            case friend = "3.Phone a friend"
    }
    
    func generateRandomPos(questionList:[QuestionBank]) -> Int{
        let randomPos  = Int.random(in: 0..<questionList.count)
        return randomPos
    }
    
    func displayRandomQuestion(totalQuesDisplay:Int, gameOption:String){
        var gameRound = 1;
        var quesNo = 1
        var newQuestionList = self.questionList
        var finalAmount = 0
        var isCorrect = false
        var totalCorrectAns = 0
        var isNo = false
        var isLifeLineUSed = false
    
        print("--------------------")
        print("Welcome to Round \(gameRound)")
        print("--------------------")
    
        var allLifeLines: [LifeLine] = []
        allLifeLines.append(LifeLine.fiftyfifty)
        allLifeLines.append(LifeLine.audience)
        allLifeLines.append(LifeLine.friend)
    
        repeat{
            if gameOption == "1" {
                if allLifeLines.count > 0 {
                    print("\nAvailable Lifelines:" , terminator:" ")
        
                    for lifeline in allLifeLines{
                        print(lifeline.rawValue, terminator:"   ")
                    }
                }
                else{
                    print("\nNo any Lifelines Available:")
                }
            }
    
            if gameOption == "2" && (gameRound == 2 || gameRound == 3) {
                if allLifeLines.count > 0 {
                print("\nAvailable Lifelines:" , terminator:" ")
                for lifeline in allLifeLines{
                    print(lifeline.rawValue, terminator:"   ")
                }
                }else{
                    print("\nNo any Lifelines Available:")
                }
            }
    
        isCorrect = false
        isLifeLineUSed = false
        let randomPos = generateRandomPos(questionList: newQuestionList)
            print("\n \nQues: \(quesNo) \(newQuestionList[randomPos].question)  $\(self.dollar[quesNo - 1])  \n \t \(newQuestionList[randomPos].answer[0]) \n \t \(newQuestionList[randomPos].answer[1]) \n \t \(newQuestionList[randomPos].answer[2]) \n \t \(newQuestionList[randomPos].answer[3])" )
    
    
        repeat{
                print("\nPlease choose your answer from given option")
             if gameOption == "1" {
                if allLifeLines.count > 0 && isLifeLineUSed == false {
    
                    print("\nOR Press L to use lifeline.")
                }
            }
            if gameOption == "2" && (gameRound == 2 || gameRound == 3) {
                if allLifeLines.count > 0 && isLifeLineUSed == false {
                    print("\nOR Press L to use lifeline.")
                }
            }
                let givenAnser:String? = readLine()
                    if let ans = givenAnser
                        {
                            if ans != "" {
                                if (ans.caseInsensitiveCompare("a") == ComparisonResult.orderedSame) ||
                                    (ans.caseInsensitiveCompare("b") == ComparisonResult.orderedSame) ||
                                    (ans.caseInsensitiveCompare("c") == ComparisonResult.orderedSame) ||
                                    (ans.caseInsensitiveCompare("d") == ComparisonResult.orderedSame)
                                    {
                                print("Is this your final anwer? Yes or No" )
                                let confirmAns: String? = readLine()
                                    var selectedAns = -1
                                if let cAns = confirmAns{
                                    if cAns != "" {
                                        if (cAns.caseInsensitiveCompare("yes") == ComparisonResult.orderedSame)  {
                                        isNo = false
                                            selectedAns = userSelectedAns(ans: ans)
                                            if selectedAns == -1 {
                                                isNo = false
                                            }
                                        let f = checkAns(correctAnsPos: selectedAns, randomPos: randomPos, newQuestionList: newQuestionList)
                                            newQuestionList = f.0
                                            isCorrect = f.1
                                            if isCorrect {
                                                finalAmount = self.dollar[quesNo - 1]
                                                quesNo += 1
                                                totalCorrectAns += 1
                                            }
                                            else { finalAmount = 0
                                                isNo = false
                                            }
                                        }
                                        else if (cAns.caseInsensitiveCompare("no") == ComparisonResult.orderedSame ){
                                            isNo = true
                                            isCorrect = false
                                        }
                                }
                                else {print("Select Yes or No to countinue the game.")
                                    isNo = true}
    
                            }
                                else{print("Please choose valid option.")
                                    isNo = true
                                }
                            }
                                else if (ans.caseInsensitiveCompare("l") == ComparisonResult.orderedSame){
                                    print("Please choose your lifeline option")
                                    let lifeline:String? = readLine()
    
                                    if let lifeLineNo = lifeline {
                                        let lifeNo = Int(lifeLineNo) 
                                        if lifeNo == 1 && allLifeLines.contains(LifeLine.fiftyfifty){
                                            print("------------------------------------------")
                                            print("Selected Lifeline  \(LifeLine.fiftyfifty.rawValue)")
                                            print("------------------------------------------")
    
    
                                            fiftyfifty(newQuestionList: newQuestionList[randomPos],quesNo: quesNo,questionList: questionList)
                                            //allLifeLines.remove(at: 0)
                                            while let index = allLifeLines.firstIndex(of: LifeLine.fiftyfifty) {
                                                allLifeLines.remove(at: index)
                                            }
                                            isNo = true
                                            isLifeLineUSed = true
                                        }
                                       
                                       else if lifeNo == 2 && allLifeLines.contains(LifeLine.audience){
                                            print("------------------------------------------")
                                            print("Selected Lifeline  \(LifeLine.audience.rawValue)")
                                            print("------------------------------------------")
    
                                            audience(newQuestionList: newQuestionList[randomPos])
                                        while let index = allLifeLines.firstIndex(of: LifeLine.audience) {
                                            allLifeLines.remove(at: index)
                                        }
                                            isNo = true
                                            isLifeLineUSed = true
    
                                        }
                                       
                                      else  if lifeNo == 3 && allLifeLines.contains(LifeLine.friend){
                                            print("------------------------------------------")
                                            print("Selected Lifeline  \(LifeLine.friend.rawValue)")
                                            print("------------------------------------------")
    
                                            askFriend(newQuestionList: newQuestionList[randomPos])
                                            //allLifeLines.remove(at: 2)
                                        while let index = allLifeLines.firstIndex(of: LifeLine.friend) {
                                            allLifeLines.remove(at: index)
                                        }
                                            isNo = true
                                            isLifeLineUSed = true
                                        }
                                      else  {
                                        print("Select valid lifeline option.")
                                        isNo = true
                                      }
    
                                    }else{
                                        isNo = true
                                        print("Select your lifeline.")
                                    }
                                }
                                //else{print("Please choose answer from given option.")
                                //isNo = true
                            
                            else{print("Please select your answer.")
                                isNo = true}
                            }
                            else{ print("You didn't place an answer")
                                isNo = true
                            }
                        }
                 
    
        }while(isNo && !isCorrect)
    
            if (gameOption == "1"){
            if (totalCorrectAns == 3 || totalCorrectAns == 6) {
                print("\nYou Win Round \(gameRound)")
                print("\nDo you want to continue the game? Press Y \n OR \nDo you want to walk away with $ \(finalAmount)? Press N")
                let continueGame:String? = readLine()
                if let cGame = continueGame{
                    if (cGame.caseInsensitiveCompare("y") == ComparisonResult.orderedSame)  {
                        if quesNo >= 4 {
                            gameRound = 2
                        }
                        if quesNo >= 6 {
                            gameRound = 3
                        }
                        print("--------------------")
                        print(" welcome to Round \(gameRound)")
                        print("--------------------")
                        finalAmount = 0
                    }
                  else  if (cGame.caseInsensitiveCompare("n") == ComparisonResult.orderedSame)  {
                        isCorrect = false
                    }
                  else{
                      print("Please select option.")
                  }
                }else{
                    print("Please select option.")
                }
            }
        }
            if (gameOption == "2"){
            if (totalCorrectAns == 5 || totalCorrectAns == 10) {
                print("\nYou Win Round \(gameRound)")
                print("\nDo you want to continue the game? Press Y \n OR \nDo you want to walk away with $ \(finalAmount)? Press N")
                let continueGame:String? = readLine()
                if let cGame = continueGame{
                    if (cGame.caseInsensitiveCompare("y") == ComparisonResult.orderedSame)  {
                        if quesNo >= 6 {
                            gameRound = 2
                        }
                        if quesNo >= 11 {
                            gameRound = 3
                        }
                        print("--------------------")
                        print(" welcome to Round \(gameRound)")
                        print("--------------------")
                        finalAmount = 0
                    }
                    if (cGame.caseInsensitiveCompare("n") == ComparisonResult.orderedSame)  {
                        isCorrect = false
                    }
                }else{
                    print("Please select option.")
                }
            }
        }
    }  while(isCorrect && quesNo <= totalQuesDisplay)
        if finalAmount > 0 {
            print("**********************************************************")
            print(" You WIN Round \(gameRound). Winning Price is $ \(finalAmount). Congratulations \(self.player.displayPlayerName()) ")
            print("**********************************************************")
        }else{
            print("You LOSE the game.")
        }
    }
    
    func userSelectedAns(ans:String) ->Int{
        var selectedAns = 0
        if (ans.caseInsensitiveCompare("a") == ComparisonResult.orderedSame){
            selectedAns = 0
        }
        else if(ans.caseInsensitiveCompare("b") == ComparisonResult.orderedSame)
        {
         selectedAns = 1
        }
        else if(ans.caseInsensitiveCompare("c") == ComparisonResult.orderedSame)
        {
           selectedAns = 2
        }
        else if(ans.caseInsensitiveCompare("d") == ComparisonResult.orderedSame)
        {
           selectedAns = 3
        }
        else{print("You didn't select valid option.")
            selectedAns = -1
            }
        return selectedAns
    }
    func checkAns(correctAnsPos:Int, randomPos: Int, newQuestionList:[QuestionBank]) -> ([QuestionBank],Bool){
    
        let randomPos = randomPos
        var newQuestionList = newQuestionList
        var isCorrect = false
    
        if ( correctAnsPos == newQuestionList[randomPos].correctAns){
            print("\nYour Answer is CORRECT!")
            for j in (0..<newQuestionList.count).reversed(){
                if newQuestionList[j].question == newQuestionList[randomPos].question {
                    newQuestionList.remove(at: j)
                    isCorrect = true
                   // print("new Size \(newQuestionList.count)")
                    break
                }
            }
    
            return  (newQuestionList,isCorrect)
    }
        else{
            print("OHHH Sorry Your answer is Wrong!.")
            return (newQuestionList, isCorrect)
        }
    }
    
    func fiftyfifty(newQuestionList:QuestionBank, quesNo:Int,questionList:[QuestionBank]){
    
        let inCorrectRandom:Int? = -1
        print("Ques: \(quesNo) \(newQuestionList.question)  $\(self.dollar[quesNo - 1])")
    
            var answerIndices = [0,1,2,3]
            answerIndices.remove(at:  newQuestionList.correctAns)
    
        if var rand = inCorrectRandom{
            if (rand = answerIndices.randomElement() ?? -1) != nil {
                if rand >  newQuestionList.correctAns {
                    print("\t \(newQuestionList.answer[newQuestionList.correctAns])")
                    print("\t \(newQuestionList.answer[rand])")
                }
    
                else if  newQuestionList.correctAns > rand{
                    print("\t \(newQuestionList.answer[rand])")
                    print("\t \(newQuestionList.answer[newQuestionList.correctAns])")
                }
        }
        }
    
    }

    func audience(newQuestionList:QuestionBank){
    
        let isRight = Bool.random()
        var randomThree:[Int] = []
        var c:Int
        var highPer:Int
        var no1:Int = -1
        var no2:Int = -1
        var no3:Int = -1
        var no4:Int = -1
    
        if isRight{
            highPer = Int.random(in: 71...100)
            for i in 0...2{
                c = Int.random(in: 1...highPer)
                randomThree.insert(c, at: i)
            }
    
            print("The audience said \n")
            if (newQuestionList.correctAns == 0) {
                no1 = highPer
            }
            else{
                no2 = randomThree[0]
                no3 = randomThree[1]
                no4 = randomThree[2]
            }
            if (newQuestionList.correctAns == 1) {
                no2 = highPer
            }
            else{no1 = randomThree[0]
                no3 = randomThree[1]
                no4 = randomThree[2]}
    
            if (newQuestionList.correctAns == 2) {
                no3 = highPer
            }
           else
            {
                no1 = randomThree[0]
                no2 = randomThree[1]
                no4 = randomThree[2]
            }
            if (newQuestionList.correctAns == 3) {
                no4 = highPer
            }
            else{
                no1 = randomThree[0]
                no2 = randomThree[1]
                no3 = randomThree[2]
            }
            print(" \(newQuestionList.answer[0])  \(no1) \n \(newQuestionList.answer[1])  \(no2) \n \(newQuestionList.answer[2])  \(no3) \n \(newQuestionList.answer[3])  \(no4)\n ")
        }
        else{
            for i in 0...3{
                c = Int.random(in: 1...100)
                randomThree.insert(c, at: i)
            }
            print("The audience said \n")
            print(" \(newQuestionList.answer[0])  \(randomThree[0]) \n \(newQuestionList.answer[1])  \(randomThree[1]) \n \(newQuestionList.answer[2])  \(randomThree[2]) \n \(newQuestionList.answer[3])  \(randomThree[3])\n ")
        }
    }

    func askFriend(newQuestionList:QuestionBank){
    
        let isRight = Bool.random()
    
        if isRight {
            print("Selected answer by your friend is  \(newQuestionList.answer[newQuestionList.correctAns])")
        }
    
        else{
            let randomPos:Int = Int.random(in: 0...3)
            print("Selected answer by your friend is  \(newQuestionList.answer[randomPos])")
        }
    }
}
