//
//  QuizViewController5.swift
//  QuizApp
//
//  Created by 垣内勇人 on 2019/03/22.
//  Copyright © 2019 Hayatokakiuchi. All rights reserved.
//

import UIKit

class QuizViewController5: UIViewController {
    
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
        
        //クイズテキストビューを一番最後に持ってくる
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
        let quiz1 = SelectionQuiz(image: UIImage(named: "koyosaidaika.png")!, text: "X財の限界効用を求めなさい。", option1: "x⁻⁰⋅⁵y⁰⋅⁵", option2: "x⁰⋅⁵y⁻⁰⋅⁵", option3: "x⁰⋅⁵y⁰⋅⁵", answer: "x⁻⁰⋅⁵y⁰⋅⁵")
        let quiz2 = SelectionQuiz(image: UIImage(named: "koyosaidaika.png")!, text: "Y財の限界効用を求めなさい。", option1: "x⁻⁰⋅⁵y⁰⋅⁵", option2: "x⁰⋅⁵y⁻⁰⋅⁵", option3: "x⁰⋅⁵y⁰⋅⁵", answer: "x⁰⋅⁵y⁻⁰⋅⁵")
        let quiz3 = SelectionQuiz(image: UIImage(named: "koyosaidaika.png")!, text: "限界代替率を求めなさい。", option1: "x/y", option2: "xy", option3: "y/x", answer: "y/x")
        let quiz4 = SelectionQuiz(image: UIImage(named: "koyosaidaika.png")!, text: "予算制約式を求めなさい", option1: "y=-x+80", option2: "y=-3/5x+80", option3: "y=-5/3x+80", answer: "y=-5/3x+80")
        let quiz5 = SelectionQuiz(image: UIImage(named: "koyosaidaika.png")!, text: "効用を最大化するX財の需要量とY財の需要量を求めなさい。", option1: "(x,y)=(12,20)", option2: "(x,y)=(24,40)", option3: "(x,y)=(48,80)", answer: "(x,y)=(24,40)")
        let quiz6 = SelectionQuiz(image: UIImage(named: "koyosaidaika.png")!, text: "所得240を所得Mとして考えたとき、最適消費点におけるX財の需要量を求めよ。", option1: "x=0.1M", option2: "x=M", option3: "x=0.6M", answer: "x=0.1M")
        let quiz7 = SelectionQuiz(image: UIImage(named: "koyosaidaika.png")!, text: "X財の価格の5をP𝗑とおいたときの消費者の効用を最大化するX財の需要関数を求めよ。", option1: "x=-P𝗑", option2: "x=120P𝗑", option3: "x=120/P𝗑", answer: "x=120/P𝗑")
        let quiz8 = SelectionQuiz(image: UIImage(named: "sisyutusaidai.png")!, text: "この消費者が128の効用を得るとき、最小の支出額はいくらか。", option1: "4", option2: "12", option3: "16", answer: "16")
        let quiz9 = SelectionQuiz(image: UIImage(named: "rodokyoukyu.png")!, text: "この労働者の効用を最大にする労働日数を求めよ。", option1: "146日", option2: "219日", option3: "302日", answer: "219日")
        let quiz10 = SelectionQuiz(image: UIImage(named: "izitennkann.png")!, text: "合理的かつ最適な行動をとる消費者の今期の貯蓄額または借入額を求めよ。", option1: "76万円の借入", option2: "80万の貯金", option3: "80万の借入", answer: "80万の借入")
        
        
        
        quizArray.append(quiz1)
        quizArray.append(quiz2)
        quizArray.append(quiz3)
        quizArray.append(quiz4)
        quizArray.append(quiz5)
        quizArray.append(quiz6)
        quizArray.append(quiz7)
        quizArray.append(quiz8)
        quizArray.append(quiz9)
        quizArray.append(quiz10)
        
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
