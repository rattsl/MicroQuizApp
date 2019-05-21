//
//  SelectionQuiz.swift
//  QuizApp
//
//  Created by 垣内勇人 on 2019/04/24.
//  Copyright © 2019 Hayatokakiuchi. All rights reserved.
//

import UIKit

class SelectionQuiz: NSObject {
    var text: String
    var option1: String
    var option2: String
    var option3: String
    var answer: String
    var image: UIImage
    
    
    init(image: UIImage, text: String, option1: String, option2: String, option3: String, answer: String) {
        self.image = image
        self.text = text
        self.option1 = option1
        self.option2 = option2
        self.option3 = option3
        self.answer = answer
    }
    
    class func shuffle(quizArray: [SelectionQuiz]) -> [SelectionQuiz] {
        var quiz = quizArray
        var shuffledQuizArray: [SelectionQuiz] = []
        for _ in 0..<quiz.count {
            let index = Int(arc4random_uniform(UInt32(quiz.count)))
            shuffledQuizArray.append(quiz[index])
            quiz.remove(at: index)
        }
        return shuffledQuizArray
    }
    


}
