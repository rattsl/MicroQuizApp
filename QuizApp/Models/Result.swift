//
//  Result.swift
//  QuizApp
//
//  Created by 垣内勇人 on 2019/03/27.
//  Copyright © 2019 Hayatokakiuchi. All rights reserved.
//

import UIKit

class Result: NSObject {
    var quizNumber: Int
    var quizText: String
    var userAnswer: String
    var answer: String
    var explain: String
    
    init(quizNumber: Int, quizText: String, userAnswer: String, answer: String, explain: String) {
        
        self.quizNumber = quizNumber
        self.quizText = quizText
        self.userAnswer = userAnswer
        self.answer = answer
        self.explain = explain
        
    }
    
    
}
