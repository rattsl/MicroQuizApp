//
//  SecondViewController.swift
//  QuizApp
//
//  Created by 垣内勇人 on 2019/03/22.
//  Copyright © 2019 Hayatokakiuchi. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    
    @IBOutlet var button1: UIButton!
    @IBOutlet var button2: UIButton!
    @IBOutlet var button3: UIButton!
    @IBOutlet var button4: UIButton!
    @IBOutlet var button5: UIButton!
    @IBOutlet var button6: UIButton!
    
 
    override func viewDidLoad() {
        super.viewDidLoad()
        
        button1.backgroundColor = UIColor.red
        button1.layer.cornerRadius = 10.0

        button2.backgroundColor = UIColor.red
        button2.layer.cornerRadius = 10.0
        
        button3.backgroundColor = UIColor.red
        button3.layer.cornerRadius = 10.0
        
        button4.backgroundColor = UIColor.red
        button4.layer.cornerRadius = 10.0
        
        button5.backgroundColor = UIColor.red
        button5.layer.cornerRadius = 10.0
        
        button6.backgroundColor = UIColor.red
        button6.layer.cornerRadius = 10.0
        
        //戻ってきた時にTabBarを表示するコード
        hidesBottomBarWhenPushed = true
        
    }
    
    @IBAction func syohisyaKijutu() {
        self.performSegue(withIdentifier: "toSyohiKiju", sender: nil)
    }
    @IBAction func seisannsyaKijutu() {
        self.performSegue(withIdentifier: "toSeiKiju", sender: nil)
    }
    @IBAction func syohisya3taku() {
        self.performSegue(withIdentifier: "toSyohi3", sender: nil)
    }
    @IBAction func seisannsya3taku() {
        self.performSegue(withIdentifier: "toSei3", sender: nil)
    }
    @IBAction func syohisyaKeisann() {
        self.performSegue(withIdentifier: "toSyohiKei", sender: nil)
    }
    @IBAction func seisannsyaKeisan() {
        self.performSegue(withIdentifier: "toSeiKei", sender: nil)
    }
}
