//
//  QuizViewController3.swift
//  QuizApp
//
//  Created by 垣内勇人 on 2019/03/22.
//  Copyright © 2019 Hayatokakiuchi. All rights reserved.
//

import UIKit

class QuizViewController3: UIViewController {
    
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
        let quiz1 = SelectionQuiz(image: UIImage(named: "mc.png")!, text: "上図において、点Aは何点というでしょうか？", option1: "損益分岐点", option2: "操業停止点", option3: "わからない", answer: "損益分岐点")
        let quiz2 = SelectionQuiz(image: UIImage(named: "pai1.png")!, text: "上図において価格がP'で与えられているとすると、利潤は上図のうち何色に当たるでしょうか？", option1: "赤", option2: "青", option3: "黄", answer: "赤")
        let quiz3 = SelectionQuiz(image: UIImage(named: "pai2.png")!, text: "上図において価格がP'で与えられているこのとき、企業はどの行動を選択するでしょうか？", option1: "生産を止める", option2: "生産を続ける", option3: "その市場から撤退する", answer: "生産を続ける")
        let quiz4 = SelectionQuiz(image: UIImage(named: "pai3.png")!, text: "上図において価格がP'で与えられているとき、企業はどの行動を選択するでしょうか？", option1: "生産を止める", option2: "生産を続ける", option3: "わからない", answer: "生産を止める")
        let quiz5 = SelectionQuiz(image: UIImage(named: "tc.png")!, text: "上図において点Aを何というでしょう？", option1: "損益分岐点", option2: "操業停止点", option3: "わからない", answer: "操業停止点")
        let quiz6 = SelectionQuiz(image: UIImage(named: "tc.png")!, text: "上図において点Bを何というでしょう？", option1: "損益分岐点", option2: "操業停止点", option3: "わからない", answer: "損益分岐点")
        let quiz7 = SelectionQuiz(image: UIImage(named: "mr=mc.png")!, text: "上図において総収入曲線と総費用曲線が与えられている。X*のとき総費用曲線の接線の傾きと総収入曲線の傾きが等しく、矢印で表されるTR-TCの縦の長さが最大になっている。これを何条件というか？", option1: "費用最大化条件", option2: "収入最大化条件", option3: "利潤最大化条件", answer: "利潤最大化条件")
        let quiz8 = SelectionQuiz(image: UIImage(named: "kouritu.png")!, text: "上図の総費用曲線において、生産効率が上がっており規模の経済の状態であるのは①と②のどちらで表されるか？", option1: "①", option2: "②", option3: "わからない", answer: "①")
        let quiz9 = SelectionQuiz(image: UIImage(named: "vc-up.png")!, text: "上図の総費用曲線が水色の点を軸に上方シフトし、可変費用が増加している。このとき当てはまらないものはどれか？", option1: "限界費用増加", option2: "平均費用減少", option3: "平均可変費用増加", answer: "平均費用減少")
        let quiz10 = SelectionQuiz(image: UIImage(named: "siyutu.png")!, text: "効用一定の下で最適消費点を考えたとき、与えられた効用を達成し、支出額をできるだけ小さくるという方法を何というでしょうか？", option1: "効用最大化", option2: "制約最小化", option3: "支出最小化", answer: "支出最小化")
        
        
        
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
