//
//  SecondViewController3.swift
//  QuizApp
//
//  Created by 垣内勇人 on 2019/04/12.
//  Copyright © 2019 Hayatokakiuchi. All rights reserved.
//

import UIKit

class SecondViewController3: UIViewController {
    
    var selectedWord: String = ""
    var selectedWordExplain: String = ""
    
    @IBOutlet var selectedWordLabel: UILabel!
    @IBOutlet var selectedWordTextView: UITextView!

    override func viewDidLoad() {
        
        selectedWordLabel.text = selectedWord
        selectedWordTextView.text = selectedWordExplain
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    

}
