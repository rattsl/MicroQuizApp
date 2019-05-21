//
//  ResultTableViewCell.swift
//  QuizApp
//
//  Created by 垣内勇人 on 2019/04/15.
//  Copyright © 2019 Hayatokakiuchi. All rights reserved.
//

import UIKit

class ResultTableViewCell: UITableViewCell {
    
    //UIパーツの宣言
    @IBOutlet var quizNumber: UILabel!
    @IBOutlet var quizImageView: UIImageView!
    @IBOutlet var quizText: UITextView!
    @IBOutlet var userAnswer: UILabel!
    @IBOutlet var answer: UILabel!
    @IBOutlet var explain: UITextView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
