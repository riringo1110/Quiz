//
//  QuizViewController.swift
//  Quiz
//
//  Created by Ririko Nagaishi on 2021/02/13.
//

import UIKit

class QuizViewController: UIViewController {
    
    //問題文を格納する配列
    var quizArray = [Any]()
    
    //正解数
    var correctAnswer: Int = 0
    
    //クイズを表示するTextview
    
    @IBOutlet var quizTextView: UITextView!
    
    //選択肢のボタン
    
    @IBOutlet var choiceButton1: UIButton!
    @IBOutlet var choiceButton2: UIButton!
    @IBOutlet var choiceButton3: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //quizArrayに問題文、３つの選択肢、答えの番号が入った配列を追加
        quizArray.append(["りりちゃはいつiPhoneアプリ開発を始めた？", "2019年", "2020年", "2021年", 3])
        quizArray.append(["りりちゃが飼ってる犬の名前は？", "ジャック", "ベンジャミン", "さだはる", 2])
        quizArray.append(["りりちゃはLeaders何期？", "10期", "11期", "12期", 3])
        quizArray.append(["りりちゃが最も苦手なことは？", "ホラー映画", "早起き", "ジェットコースター", 2])
        quizArray.append(["りりちゃのiPhoneの機種は？", "iPhone12pro", "iPhone8", "iPhoneXs", 3])
        quizArray.append(["りりちゃのiPhoneにはいくつのアプリが入っている？", "70", "80", "90", 2])
        
        //問題をシャッフル
        quizArray.shuffle()
        
        choiceQuiz()
    }
    
    func choiceQuiz() {
        //クイズを一時的に取り出しておく配列
        let tmpArray = quizArray[0] as! [Any]
        
        //問題文を表示
        quizTextView.text = tmpArray[0] as? String
        
        //選択肢ボタンにそれぞれの選択肢をセット
        choiceButton1.setTitle(tmpArray[1] as? String, for: .normal)
        choiceButton2.setTitle(tmpArray[2] as? String, for: .normal)
        choiceButton3.setTitle(tmpArray[3] as? String, for: .normal)
    }
    
    func performSegueToResult() {
        performSegue(withIdentifier: "toResultView", sender: nil)
    }
    
    //セグエを準備するときに呼ばれるメソッド
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toResultView" {
            let resultViewController = segue.destination as! ResultViewController
            resultViewController.correctAnswer = self.correctAnswer
        }
    }
    //引数のsender.tagに格納されているTagの値を使って処理を区別
    @IBAction func choiceAnswer(sender: UIButton) {
        
        let tmpArray = quizArray[0] as! [Any]
        
        if tmpArray[4] as! Int == sender.tag {
            
            //正解数を増やす
            correctAnswer = correctAnswer + 1
        }
        
        //といた問題をquizArrayから取り除く
        quizArray.remove(at: 0)
        
        //といた問題数の合計があらかじめ設定していた問題数に達したら結果画面へ
        if quizArray.count == 0 {
            performSegueToResult()
        }else{
            choiceQuiz()
        }
    }
}
