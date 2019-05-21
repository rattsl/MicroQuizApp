//
//  ViewController.swift
//  QuizApp
//
//  Created by 垣内勇人 on 2019/03/22.
//  Copyright © 2019 Hayatokakiuchi. All rights reserved.
//

import UIKit
import SwiftyGif

class ViewController: UIViewController {
    
    @IBOutlet var button: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        button.backgroundColor = UIColor.red
        button.layer.cornerRadius = 10.0
        
        
        
    }
    @IBAction func next() {
        self.performSegue(withIdentifier: "toCategory", sender: nil)
    }
    
}

