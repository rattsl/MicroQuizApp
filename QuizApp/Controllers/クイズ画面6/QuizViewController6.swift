//
//  QuizViewController6.swift
//  QuizApp
//
//  Created by 垣内勇人 on 2019/03/22.
//  Copyright © 2019 Hayatokakiuchi. All rights reserved.
//

import UIKit

class QuizViewController6: UIViewController {
    
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
        let quiz1 = SelectionQuiz(image: UIImage(named: "seisankansu.png")!, text: "労働の限界生産力を求めよ。", option1: "A𝒂Lᵃ⁻¹K¹⁻ᵃ", option2: "A𝒂L¹⁻ᵃK¹⁻ᵃ", option3: "ALᵃ⁻¹K¹⁻ᵃ", answer: "A𝒂Lᵃ⁻¹K¹⁻ᵃ")
        let quiz2 = SelectionQuiz(image: UIImage(named: "seisankansu.png")!, text: "資本の限界生産力を求めよ。", option1: "A(1-𝒂)LᵃKᵃ", option2: "A(𝒂-1)LᵃK⁻ᵃ", option3: "A(1-𝒂)LᵃK⁻ᵃ", answer: "A(1-𝒂)LᵃK⁻ᵃ")
        let quiz3 = SelectionQuiz(image: UIImage(named: "seisankansu.png")!, text: "技術的限界代替率を求めよ。", option1: "𝒂K/(1-𝒂)L", option2: "𝒂L/(1-𝒂)K", option3: "(1-𝒂)K/(1-𝒂)L", answer: "𝒂K/(1-𝒂)L")
        let quiz4 = SelectionQuiz(image: UIImage(named: "hiyokannsu.png")!, text: "この企業の限界収入はいくらか。", option1: "7", option2: "10", option3: "15", answer: "15")
        let quiz5 = SelectionQuiz(image: UIImage(named: "hiyokannsu.png")!, text: "この企業の固定費用はいくらか。", option1: "23", option2: "40", option3: "48", answer: "40")
        let quiz6 = SelectionQuiz(image: UIImage(named: "hiyokannsu.png")!, text: "産出量Qが7のとき、この企業の可変費用はいくらか。", option1: "23", option2: "48", option3: "63", answer: "23")
        let quiz7 = SelectionQuiz(image: UIImage(named: "hiyokannsu.png")!, text: "産出量Qが10のとき、この企業の限界費用はいくらか。", option1: "15", option2: "23", option3: "40", answer: "15")
        let quiz8 = SelectionQuiz(image: UIImage(named: "hiyokannsu.png")!, text: "この企業の損益分岐点の価格を求めよ。", option1: "7", option2: "9", option3: "10", answer: "9")
        let quiz9 = SelectionQuiz(image: UIImage(named: "hiyokannsu.png")!, text: "利潤が最大となる労働投入量を求めよ。", option1: "12", option2: "100", option3: "105", answer: "12")
        let quiz10 = SelectionQuiz(image: UIImage(named: "hiyokannsu.png")!, text: "利潤が最大になっているときの労働の限界生産力を求めよ。", option1: "1", option2: "1/2", option3: "1/3", answer: "1/3")
        
        
        
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
