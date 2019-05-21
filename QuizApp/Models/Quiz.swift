//
//  Quiz.swift
//  QuizApp
//
//  Created by 垣内勇人 on 2019/03/22.
//  Copyright © 2019 Hayatokakiuchi. All rights reserved.
//

import UIKit

class Quiz: NSObject {
    
    var text: String
    var answer: String
    var explain: String
    
    init(text: String, answer: String, explain: String) {
        self.text = text
        self.answer = answer
        self.explain = explain
    }
    
    class func shuffle(quizArray: [Quiz]) -> [Quiz] {
        var quiz = quizArray
        var shuffledQuizArray: [Quiz] = []
        for _ in 0..<quiz.count {
            let index = Int(arc4random_uniform(UInt32(quiz.count)))
            shuffledQuizArray.append(quiz[index])
            quiz.remove(at: index)
        }
        return shuffledQuizArray
    }

}
