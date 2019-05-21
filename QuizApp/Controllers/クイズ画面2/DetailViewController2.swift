//
//  DetailViewController2.swift
//  QuizApp
//
//  Created by 垣内勇人 on 2019/03/27.
//  Copyright © 2019 Hayatokakiuchi. All rights reserved.
//

import UIKit

class DetailViewController2: UIViewController,UITableViewDataSource, UITableViewDelegate {
    
    
    //TableView
    @IBOutlet var resultTableView: UITableView!
    
    //変数の宣言
    var resultArray = [Result]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //delegate署名
        resultTableView.delegate = self
        resultTableView.dataSource = self
        
        resultTableView.rowHeight = 250.0
        resultTableView.tableFooterView = UIView()
        //カスタムセルの登録
        let nib = UINib(nibName: "ResultTableViewCell", bundle: Bundle.main)
        resultTableView.register(nib, forCellReuseIdentifier: "resultCell")
        
    }
    
    //TableViewのセルの数を決める
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return resultArray.count
    }
    
    //TableViewのセルの内容を決める
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "resultCell") as! ResultTableViewCell
        let number = resultArray[indexPath.row].quizNumber
        //セルのquizTextの文字の部分に、ResultArrayのquizTextを代入
        cell.quizText.text = resultArray[indexPath.row].quizText
        cell.quizNumber.text = String(number + 1) + "問目"
        cell.userAnswer.text = resultArray[indexPath.row].userAnswer
        cell.answer.text = resultArray[indexPath.row].answer
        cell.explain.text = resultArray[indexPath.row].explain
        //正解or誤答で表示する画像を変える
        if resultArray[indexPath.row].userAnswer == resultArray[indexPath.row].answer {
            //まるの画像を表示
            cell.quizImageView.image = UIImage(named: "maruImage.png")
        } else {
            //バツの画像を表示
            cell.quizImageView.image = UIImage(named: "batsuImage.png")
        }
        return cell
    }
    //セルが押された時のメソッド
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    //Homeへ戻るボタン
    @IBAction func home() {
       
        navigationController?.popToViewController(navigationController!.viewControllers[0], animated: true)
        //次のクイズ用に毎回resultArrayを一新
        resultArray.removeAll()
    }
    
    
}
