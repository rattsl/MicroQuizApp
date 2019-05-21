//
//  ViewController3.swift
//  QuizApp
//
//  Created by 垣内勇人 on 2019/04/12.
//  Copyright © 2019 Hayatokakiuchi. All rights reserved.
//

import UIKit

class ViewController3: UIViewController,UITableViewDataSource,UITableViewDelegate {
    
    var wordData = [["word": "予算制約", "explain": "経済主体、特に消費者が購入する財の消費量の組み合わせを規定する制約。"],
                    ["word": "限界効用", "explain": "ある財の消費量 (需要量)を追加的に1単位変化させたときの効用の増加分。"],
                    ["word": "無差別曲線", "explain": "同一の効用水準を与える2財の消費量の組み合わせの軌跡。"],
                    ["word": "限界代替率", "explain": "X財の消費量をある状態から追加的に1単位増加(減少)させたとき、同一の効用水準を維持するために減少(増加)させなければならないY財の消費量の増加分。"],
                    ["word": "需要曲線", "explain": "財の価格と需要量の関係を表す曲線。通常は価格が下落すれば当該財への需要量は増加し、価格が上昇すると需要量は減少する需要の法則が成立する。需要の法則が成立する場合、需要曲線は右下がりである。"],
                    ["word": "ギッフェン財", "explain": "価格が低下（上昇）したときに需要量が減少（増加）する財。ギッフェン財は下級財の一種であり、価格の低下に伴う代替効果による需要量の増加を、所得効果による需要量の減少が絶対値で見ると上回り、全部効果では価格の低下によって需要量が減少する財である。"],
                    ["word": "上級財", "explain": "所得増加(減少)によって、需要量が増加(減少)する財。"],
                    ["word": "下級財", "explain": "所得の増加(減少)によって需要量が減少(増加)する財。"],
                    ["word": "需要の所得弾力性", "explain": "所得が1％変化したときに、需要量が何％変化するかを表したもの。"],
                    ["word": "需要の価格弾力性", "explain": "価格が1％変化したときに需要量が何％変化するかを表したもの。"],
                    ["word": "需要の交差弾力性", "explain": "ある財の価格の変化率に対するもう一方の財の需要量の変化率の比。"],
                    ["word": "代替財", "explain": "ある財の価格が下落(上昇)すると、もう一方の財は価格が相対的に上昇(下落)し需要量が減少(増加)する関係にある財。"],
                    ["word": "補完財", "explain": "ある財の価格が下落(上昇)するともう一方の財の需要量が増加(減少)する関係にある財。"],
                    ["word": "労働の限界生産力", "explain": "他の全ての生産要素の投入量を一定に保ちながら、労働の投入量を1単位増やしたとき、どれだけ生産量が増えるかを表したもの。"],
                    ["word": "資本の限界生産力", "explain": "他の全ての生産要素の投入量を一定に保ちながら、資本の投入量を1単位増やしたときどれだけ生産量が増えるかを表したもの。"],
                    ["word": "技術的限界代替率", "explain": "労働投入量を1単位減らしたとき、同じ生産量を維持するために増やさなければならない資本投入量の増加分。"],
                    ["word": "総費用曲線", "explain": "ある財の生産に全体でどれだけ費用がかかるかを表したもの。TC。一般的にグラフ上では逆S字の関数。可変費用と固定費用を足し合わせると導出できる。"],
                    ["word": "限界費用", "explain": "生産量を1単位増やしたときにどれだけ費用が増加するか表したもの。MC。総費用を生産量で微分したもの。"],
                    ["word": "平均費用", "explain": "生産量1単位あたりの総費用。AC。グラフ上では原点から総費用曲線上の1点に引いた接線の傾きに当たる。"],
                    ["word": "可変費用", "explain": "材料費といった、生産量の短期的変動に伴い変化する費用。VC。"],
                    ["word": "平均可変費用", "explain": "生産量1単位あたりの可変費用。AVC。"],
                    ["word": "固定費用", "explain": "設備投資といった、生産量の変動にかかわらず必要とされる費用。FC。"],
                    ["word": "平均固定費用", "explain": "生産量1単位あたりの固定費用。AFC。"],
                    ["word": "損益分岐点", "explain": "「価格＝限界費用＝平均費用」が成立し、利潤がゼロになる点。グラフ上では平均費用が一番小さい点で表される。"],
                    ["word": "操業停止点", "explain": "「価格＝限界費用＝平均可変費用」が成立し、グラフ上では平均可変費用"],
                    ["word": "供給曲線", "explain": "価格が与えられたときに、その価格に対して利潤最大化の結果として導出される供給量を対応させるグラフ。縦軸に価格、横軸に生産量を置いたとき基本的には右下がりのグラフができる。"],
                    ["word": "完全競争市場", "explain": "完全競争市場においては、①財が同質である。②売り手と買い手の間において情報は完全である。③市場に多数の需要給者が存在する。④新規参入退出が自由である、の4つの特徴を持ち合わせる。"]]
    
    
    @IBOutlet var wordTableView: UITableView!

    override func viewDidLoad() {
        
        wordTableView.dataSource = self
        
        wordTableView.delegate = self
        
        wordTableView.tableFooterView = UIView()
        

        // Do any additional setup after loading the view.
    }
    //セルの個数を登録
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return wordData.count
    }
    //セルの内容を表示
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell")!
        //ラベルに名前を表示
        cell.textLabel?.text = wordData[indexPath.row]["word"]
        
        return cell
    }
    //セルが選択されたときのメソッド
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: "toDetail", sender: nil)
        tableView.deselectRow(at: indexPath, animated: true)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //次の画面の取得
        let secondViewController3 = segue.destination as! SecondViewController3
        //セルの選択
        let selectedIndex = wordTableView.indexPathForSelectedRow!
        //word配列を次に渡す
        secondViewController3.selectedWord = wordData[selectedIndex.row]["word"]!
        //explain配列を次に渡す
        secondViewController3.selectedWordExplain = wordData[selectedIndex.row]["explain"]!
    }

}
