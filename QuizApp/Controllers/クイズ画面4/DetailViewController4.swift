//
//  DetailViewController4.swift
//  QuizApp
//
//  Created by 垣内勇人 on 2019/04/05.
//  Copyright © 2019 Hayatokakiuchi. All rights reserved.
//

import UIKit

class DetailViewController4: UIViewController ,UITableViewDataSource, UITableViewDelegate {
    
    
    //TableView
    @IBOutlet var resultTableView: UITableView!
    
    //変数の宣言
    var resultArray = [Result]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //delegate署名
        resultTableView.delegate = self
        resultTableView.dataSource = self
        
        resultTableView.rowHeight = 191.0
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
        //セルのquizTextの文字の部分に、ResultArrayのquizTextを代入
        cell.quizText.text = resultArray[indexPath.row].quizText
        cell.quizNumber.text = resultArray[indexPath.row].quizNumber as? String
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
    
    
    //Homeへ戻るボタン
    @IBAction func home() {
        //FrontQuizというIDがついたStoryBoardに遷移
        let storyboard: UIStoryboard = self.storyboard!
        let nextView = storyboard.instantiateViewController(withIdentifier: "FrontQuiz")
        present(nextView, animated: true, completion: nil)
        
        //次のクイズ用に毎回resultArrayを一新
        resultArray.removeAll()
    }
    
    
}
