//
//  QuizViewController1.swift
//  QuizApp
//
//  Created by 垣内勇人 on 2019/03/22.
//  Copyright © 2019 Hayatokakiuchi. All rights reserved.
//

import UIKit

class QuizViewController1: UIViewController,UITextFieldDelegate {
    
    var point = 0
    var quizNumber = 0
    var quizArray = [Quiz]()
    var resultArray = [Result]()
    
    @IBOutlet var quizNumberLabel: UILabel!
    @IBOutlet var quizTextView: UITextView!
    @IBOutlet var quizTextField: UITextField!

    
    override func viewDidLoad() {
        
        quizTextField.delegate = self
        
        setUpQuiz()
        
        showQuiz()
        
        //NavigationControllerの戻るボタンを隠すコード
        self.navigationItem.hidesBackButton = true
        
        //下のTabBarを隠すコード
        tabBarController?.tabBar.isHidden = true
        
        super.viewDidLoad()
    }
    
    
    func setUpQuiz() {
        let quiz1 = Quiz(text: "ある財の消費量 (需要量)を追加的に1単位変化させたときの効用の増加分のことを（　　　）という。", answer: "限界効用", explain: "財の量が増加するにつれて、その財の限界効用すなわち効用の増加分は次第に小さくなるという限界効用逓減の法則がある。")
        let quiz2 = Quiz(text: "同一の効用水準を与える2財の消費量の組み合わせの軌跡を（　　　）という。", answer: "無差別曲線", explain: "横軸にX財の消費量、縦軸にY財の消費量をとったグラフで考える。無差別曲線上の点はある人のX財とY財の消費量の組み合わせを表し、X財とY財の組み合わせに対する効用水準を知ることができる。")
        let quiz3 = Quiz(text: "X財の消費量をある状態から追加的に1単位増加(減少)させたとき、同一の効用水準を維持するために減少(増加)させなければならないY財の消費量の増加分を（　　　）という。", answer: "限界代替率", explain: "限界代替率は無差別曲線の接線の傾きの絶対値は等しい。")
        let quiz4 = Quiz(text: "所得増加(減少)によって、需要量が増加(減少)する財を（　　　）という。", answer: "上級財", explain: "正常財とも言われる。")
        let quiz5 = Quiz(text: "所得が1％変化したときに、需要量が何％変化するかを表したものを（　　　）という。", answer: "需要の所得弾力性", explain: "需要量の変化率を所得の変化率で割ったもの。数値で表すと上級財が正、中級財がゼロ、下級財が負となる。")
        let quiz6 = Quiz(text: "価格が1％変化したときに需要量が何％変化するかを表したものを（　　　）という。", answer: "需要の価格弾力性", explain: "需要量の変化率を価格の変化率で割り、マイナスをつけたものでも表される。")
        let quiz7 = Quiz(text: "所得の増加(減少)によって需要量が減少(増加)する財を（　　　）という。", answer: "下級財", explain: "劣等財とも言われる。")
        let quiz8 = Quiz(text: "ある財の価格が下落(上昇)すると、もう一方の財は価格が相対的に上昇(下落)し需要量が減少(増加)する関係にある財を（　　　）という。", answer: "代替財", explain: "例）スターバックスのコーヒーとドトールのコーヒー。")
        let quiz9 = Quiz(text: "ある財の価格が下落(上昇)するともう一方の財の需要量が増加(減少)する関係にある財を（　　　）という。", answer: "補完財", explain: "例）iPhoneとiPhoneケース")
        
        quizArray.append(quiz1)
        quizArray.append(quiz2)
        quizArray.append(quiz3)
        quizArray.append(quiz4)
        quizArray.append(quiz5)
        quizArray.append(quiz6)
        quizArray.append(quiz7)
        quizArray.append(quiz8)
        quizArray.append(quiz9)
       
        quizArray = Quiz.shuffle(quizArray: quizArray)
        
    }
    
    func showQuiz() {
        quizNumberLabel.text = String(quizNumber + 1) + "問目"
        quizTextView.text = quizArray[quizNumber].text
        
    }
    
    func updateQuiz() {
        quizNumber = quizNumber + 1
        
        if quizNumber == quizArray.count {
            let alertText = "\(quizArray.count)問中、\(point)問正解でした。"
            let alertController = UIAlertController(title: "結果", message: alertText, preferredStyle: .alert)
            let okAction = UIAlertAction(title: "OK", style: .default, handler: { (action) in
                self.performSegue(withIdentifier: "toDetail", sender: nil)
                
            })
            alertController.addAction(okAction)
            self.present(alertController, animated: true, completion: nil)
            
        } else {
            showQuiz()
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    
    
    @IBAction func answered() {
        
        if quizTextField.text == quizArray[quizNumber].answer {
            print("正解")
            point = point + 1
            
            let alert = UIAlertController(title: "正解", message: nil, preferredStyle: .actionSheet)
            let okAction = UIAlertAction(title: "次へ", style: .default) { (action) in
                alert.dismiss(animated: true, completion: nil)
                //Resultクラスのインスタンスを作る
                let result = Result(quizNumber: self.quizNumber, quizText: self.quizArray[self.quizNumber].text, userAnswer: self.quizTextField.text!, answer: self.quizArray[self.quizNumber].answer, explain: self.quizArray[self.quizNumber].explain)
                //インスタンスを配列に追加
                self.resultArray.append(result)
                self.updateQuiz()
                self.quizTextField.text = ""
            }
            alert.addAction(okAction)
            self.present(alert, animated: true, completion: nil)
            
            
        } else {
            print("不正解")
            let alert = UIAlertController(title: "不正解", message: nil, preferredStyle: .actionSheet)
            let okAction = UIAlertAction(title: "次へ", style: .default) { (action) in
                alert.dismiss(animated: true, completion: nil)
                //Resultクラスのインスタンスを作る
                let result = Result(quizNumber: self.quizNumber, quizText: self.quizArray[self.quizNumber].text, userAnswer: self.quizTextField.text!, answer: self.quizArray[self.quizNumber].answer, explain: self.quizArray[self.quizNumber].explain)
                //インスタンスを配列に追加
                self.resultArray.append(result)
                self.updateQuiz()
                self.quizTextField.text = ""
            }
            alert.addAction(okAction)
            self.present(alert, animated: true, completion: nil)
            
            
        }
        
        
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let detailViewController = segue.destination as! DetailViewController1
        detailViewController.resultArray = resultArray
    }

    
}
