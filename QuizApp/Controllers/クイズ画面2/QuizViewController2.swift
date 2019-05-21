//
//  QuizViewController2.swift
//  QuizApp
//
//  Created by 垣内勇人 on 2019/03/22.
//  Copyright © 2019 Hayatokakiuchi. All rights reserved.
//

import UIKit

class QuizViewController2: UIViewController,UITextFieldDelegate {
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
        let quiz1 = Quiz(text: "生産者の前提として、企業は（　　　）を最大化するように行動する。", answer: "利潤", explain: "生産物価格が限界費用と等しくなるという利潤最大化条件がある。")
        let quiz2 = Quiz(text: "ある経済活動を選択することによって失う利益を（　　　）という。", answer: "機会費用", explain: "1つの経済活動において、それを選択することで失う経済活動の機械のうちの最大収益。")
        let quiz3 = Quiz(text: "労働投入量を1単位変化させたときの生産量の変化分を（　　　）という。", answer: "労働の限界生産力", explain: "MPʟで表される。労働量を増加させると生産量全体としては増えるが、増加分が次第に減少していくという労働の限界生産力低減の法則がある。")
        let quiz4 = Quiz(text: "資本投入量を1単位変化させたときの生産量の変化分を（　　　）という。", answer: "資本の限界生産力", explain: "MP𝐤で表される。資本ストックの投入量を増大させるにつれ、資本の限界生産力が減少するという資本の労働限界生産力低減の法則がある。")
        let quiz5 = Quiz(text: "労働投入量を追加的に1単位増やしたときに、同じ生産量を保つために減らさなければならない資本投入量の数量、また等量曲線の接線の傾きの絶対値を（　　　）という。", answer: "技術的限界代替率", explain: "等量曲線の接線の傾きの絶対値に等しい。MRTSで表される。")
        let quiz6 = Quiz(text: "生産量を追加的に１単位増加させたときの総費用の変化分を（　　　）という。", answer: "限界費用", explain: "MCで表される。総費用曲線の接線の傾きに相当し、総費用曲線を生産量で微分したものである。")
        let quiz7 = Quiz(text: "材料費といった、生産量の短期的変動に伴い変化する費用を（　　　）という。", answer: "可変費用", explain: "VCで表される。生産量1単位あたりの可変費用を平均可変費用という。")
        let quiz8 = Quiz(text: "生産量1単位あたりの総費用を（　　　）という。", answer: "平均費用", explain: "ACで表される。グラフ上では原点から総費用曲線上の1点に引いた接線の傾きに当たる。")
        let quiz9 = Quiz(text: "設備投資といった、生産量の変動にかかわらず必要とされる費用を（　　　）という。", answer: "固定費用", explain: "FCで表される。")
        let quiz10 = Quiz(text: "完全競争市場において価格は与えられたものとして考え、買い手や売り手は価格支配力を持たない（　　　）として行動する。", answer: "プライステイカー", explain: "その市場全体の取引量を占める割合において、消費者や生産者の需給量は無視できるほど小さく、価格支配力を持たない。")
        
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
        let detailViewController = segue.destination as! DetailViewController2
        detailViewController.resultArray = resultArray
    }
    
    
}
