//
//  QuizViewController4.swift
//  QuizApp
//
//  Created by 垣内勇人 on 2019/03/22.
//  Copyright © 2019 Hayatokakiuchi. All rights reserved.
//

import UIKit

class QuizViewController4: UIViewController {
          
    var point: Int = 0
    var quizNumber: Int = 0
    var quizArray: [SelectionQuiz] = []
    
    @IBOutlet var quizImageView: UIImageView!
    @IBOutlet var quizNumberLabel: UILabel!
    @IBOutlet var quizTextView: UITextView!
    @IBOutlet var option1Button: UIButton!
    @IBOutlet var option2Button: UIButton!
    @IBOutlet var option3Button: UIButton!
    
    //応用課題：まる、ばつのImageView
    @IBOutlet var animationImageView: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //ビューを一番最後に持ってくる
        self.view.sendSubviewToBack(quizTextView)
        
        setUpQuiz()
        
        showQuiz()
        
        //NavigationControllerの戻るボタンを隠すコード
        self.navigationItem.hidesBackButton = true
        
        //下のTabBarを隠すコード
        tabBarController?.tabBar.isHidden = true
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setUpQuiz() {
        let quiz1 = SelectionQuiz(image: UIImage(named: "danryokusei.png")!, text: "上図において需要の価格弾力性が高く、価格に敏感に反応するのはD'とD''のどちらでしょうか？", option1: "D'", option2: "D''", option3: "わからない", answer: "D''")
        let quiz2 = SelectionQuiz(image: UIImage(named: "zai1.png")!, text: "上図においてX財の価格が下落したときのY財は何財に当たるでしょうか？", option1: "代替財", option2: "補完財", option3: "上級財", answer: "補完財")
        let quiz3 = SelectionQuiz(image: UIImage(named: "zai2.png")!, text: "上図においてX財の価格が下落したときのY財は何財に当たるでしょうか？", option1: "代替財", option2: "補完財", option3: "下級財", answer: "")
        let quiz4 = SelectionQuiz(image: UIImage(named: "zai3.png")!, text: "上図においてX財の価格が下落したとき、X財は何財に当たるでしょうか？", option1: "、独立財", option2: "需要の法則が成立する財", option3: "ギッフェン財", answer: "ギッフェン財")
        let quiz5 = SelectionQuiz(image: UIImage(named: "kouka.png")!, text: "上図はX財の価格が下落を代替効果と所得効果に分けて分析したものである。このとき、青色で表される矢印は何効果に分類されるでしょうか？　ただしX財は上級財であるとする。", option1: "代替効果", option2: "所得効果", option3: "全部効果", answer: "所得効果")
        let quiz6 = SelectionQuiz(image: UIImage(named: "syotoku.png")!, text: "所得が増加した際、上図の予算線はどちら側に並行シフトするでしょうか？", option1: "A", option2: "B", option3: "変化しない", answer: "A")
        let quiz7 = SelectionQuiz(image: UIImage(named: "kakaku.png")!, text: "価格が増加した際、上図の予算線はどちら側にシフトするでしょうか？", option1: "A", option2: "B", option3: "変化しない", answer: "B")
        let quiz8 = SelectionQuiz(image: UIImage(named: "yosannsenn.png")!, text: "予算線が上図のように与えられていたとすると、予算が余っている状態を表すのはどの点でしょうか？", option1: "A", option2: "B", option3: "C", answer: "A")
        let quiz9 = SelectionQuiz(image: UIImage(named: "leonchef.png")!, text: "上図はレオンチェフ型の無差別曲線である。この型の二財の例として当てはまるのは次のうちどれでしょうか？", option1: "ドトールとスタバ", option2: "靴下1足", option3: "お刺身と醤油", answer: "靴下い1足")
       
        
        
        
        quizArray.append(quiz1)
        quizArray.append(quiz2)
        quizArray.append(quiz3)
        quizArray.append(quiz4)
        quizArray.append(quiz5)
        quizArray.append(quiz6)
        quizArray.append(quiz7)
        quizArray.append(quiz8)
        quizArray.append(quiz9)
        
        quizArray = SelectionQuiz.shuffle(quizArray: quizArray)
    }
    
    func showQuiz() {
        quizNumberLabel.text = String(quizNumber + 1) + "問目"
        quizImageView.image = quizArray[quizNumber].image
        quizTextView.text = quizArray[quizNumber].text
        option1Button.setTitle(quizArray[quizNumber].option1, for: .normal)
        option2Button.setTitle(quizArray[quizNumber].option2, for: .normal)
        option3Button.setTitle(quizArray[quizNumber].option3, for: .normal)
        
        //応用課題：問題画像のアニメーション
        quizImageView.alpha = 0.0
        UIView.animate(withDuration: 1.0) {
            self.quizImageView.alpha = 1.0
        }
    }
    
    //ボタン押して判定した後
    func resetQuiz() {
        point = 0
        quizNumber = 0
        self.quizArray = SelectionQuiz.shuffle(quizArray: self.quizArray)
        navigationController?.popToViewController(navigationController!.viewControllers[1], animated: true)
    }
    //ボタン押して判定した後
    func updateQuiz() {
        quizNumber = quizNumber + 1
        
        if quizNumber == quizArray.count {
            let alertText = "\(quizArray.count)問中、\(point)問正解でした。"
            let alertController = UIAlertController(title: "結果", message: alertText, preferredStyle: .alert)
            let okAction = UIAlertAction(title: "OK", style: .default, handler: { (action) in
                self.resetQuiz()
            })
            alertController.addAction(okAction)
            self.present(alertController, animated: true, completion: nil)
            quizImageView.image = UIImage(named: "Congratulations-Pic.png")
            
        } else {
            showQuiz()
        }
    }
    
    @IBAction func selectOption1() {
        if option1Button.titleLabel?.text == quizArray[quizNumber].answer {
            print("正解！")
            point = point + 1
            maruAnimation()
        } else {
            print("不正解！")
            batsuAnimation()
        }
        
        updateQuiz()
        
    }
    
    @IBAction func selectOption2() {
        if option2Button.titleLabel?.text == quizArray[quizNumber].answer {
            print("正解！")
            point = point + 1
            maruAnimation()
        } else {
            print("不正解！")
            batsuAnimation()
        }
        updateQuiz()
        
    }
    
    @IBAction func selectOption3() {
        if option3Button.titleLabel?.text == quizArray[quizNumber].answer {
            print("正解！")
            point = point + 1
            maruAnimation()
        } else {
            print("不正解！")
            batsuAnimation()
        }
        updateQuiz()
    }
    
    //応用課題：まるのアニメーション
    func maruAnimation() {
        animationImageView.image = UIImage(named: "maruImage.png")
        //アニメーション
        animationImageView.alpha = 1.0
        UIView.animate(withDuration: 1.0) {
            self.animationImageView.alpha = 0.0
        }
    }
    
    //応用課題：ばつのアニメーション
    func batsuAnimation() {
        animationImageView.image = UIImage(named: "batsuImage.png")
        //アニメーション
        animationImageView.alpha = 1.0
        UIView.animate(withDuration: 1.0) {
            self.animationImageView.alpha = 0.0
        }
    }
    
    
}

