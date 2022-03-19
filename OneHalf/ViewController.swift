//
//  ViewController.swift
//  OneHalf
//
//  Created by 青原光 on 2021/11/11.
//

import UIKit
import GameKit

// UserDefaultsのインスタンス
let userDefaults = UserDefaults.standard


class ViewController: UIViewController {
    
    //-----Outlet接続した変数・関数-----------------------
    @IBOutlet weak var bestScoreLabel: UILabel!
    @IBOutlet weak var currentScoreLabel: UILabel!
    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var menuButton: UIButton!
    
    @IBAction func tappedButton1(_ sender: Any) {
        disableButtons()
        nextButton.isHidden = false
        
        if (randNum == 1) {
            // Hapticを再生
            impactGen.impactOccurred()
            
            // circleを表示
            imageView.image = UIImage(named: "circle")
            imageView.isHidden = false
            
            currentScore += 1
            
            // ベストスコア更新
            if (currentScore > bestScore) {
                userDefaults.set(currentScore, forKey: "BestScore")
            }
        } else {
            // Hapticを再生
            notificationGen.notificationOccurred(.error)
            
            // crossを表示
            imageView.image = UIImage(named: "cross")
            imageView.isHidden = false
            
            currentScore = 0
        }
        
        userDefaults.set(currentScore, forKey: "CurrentScore")
    }
    @IBAction func tappedButton2(_ sender: Any) {
        disableButtons()
        nextButton.isHidden = false
        
        if (randNum == 2) {
            // Hapticを再生
            impactGen.impactOccurred()
            
            // circleを表示
            imageView.image = UIImage(named: "circle")
            imageView.isHidden = false
            
            currentScore += 1
            
            // ベストスコア更新
            if (currentScore > bestScore) {
                userDefaults.set(currentScore, forKey: "BestScore")
            }
        } else {
            // Hapticを再生
            notificationGen.notificationOccurred(.error)
            
            // crossを表示
            imageView.image = UIImage(named: "cross")
            imageView.isHidden = false
            
            currentScore = 0
        }
        
        userDefaults.set(currentScore, forKey: "CurrentScore")
    }
    @IBAction func tappedNext(_ sender: Any) {
        // Hapticを再生
        impactGen.impactOccurred()
        
        // 画面をロード
        viewDidLoad()
    }
    @IBAction func tappedMenu(_ sender: Any) {
        impactGen.impactOccurred()
    }
    //-------------------------------------------------
    
    //-----その他の定数・変数・メソッド-------------------------
    // Haptic Feedbackを使用するための宣言
    let impactGen = UIImpactFeedbackGenerator(style: .medium)
    let notificationGen = UINotificationFeedbackGenerator()
    // 現在のスコア
    var currentScore = 0
    // これまでの最高スコア
    var bestScore = 0
    // 乱数
    var randNum = 1
    // ボタンを有効化するメソッド
    func enableButtons() {
        button1.isEnabled = true
        button2.isEnabled = true
        menuButton.isHidden = false
    }
    // ボタンを無効化するメソッド
    func disableButtons() {
        button1.isEnabled = false
        button2.isEnabled = false
        menuButton.isHidden = true
    }
    
    // LeaderBoardにスコアを送信
    func submit() {
        GKLeaderboard.submitScore(bestScore, context: 1, player: GKLocalPlayer.local, leaderboardIDs: ["bestscore"], completionHandler: {(error) in
            if error != nil {
                print("GameCenter送信時にエラー")
            }
        })
        print("submitしました")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        // ScoreBoardの更新
//        if (GKLocalPlayer.local.isAuthenticated) {
//            GKLeaderboard.loadLeaderboards(IDs: ["bestscore"]) {
//                leaderboards, _ in leaderboards?[0].loadEntries(for: [GKLocalPlayer.local], timeScope: .allTime) {
//                    player, _, _ in self.userDefaults.set(player?.score, forKey: "BestScore")
//                }
//            }
//        }
        
        // UserDefaultsの初期値
        userDefaults.register(defaults: ["CurrentScore": 0, "BestScore": 0])
        
        // スコアの取得
        currentScore = userDefaults.object(forKey: "CurrentScore") as! Int
        bestScore = userDefaults.object(forKey: "BestScore") as! Int
        
        submit()
        
        // Haptic Feedbackの遅延をなくすためのコード
        impactGen.prepare()
        notificationGen.prepare()
        
        // ラベルの更新
        currentScoreLabel.text = "Current Score: " + String(currentScore)
        bestScoreLabel.text = "Best Score: " + String(bestScore)
        
        randNum = Int.random(in: 1 ... 2)
        imageView.isHidden = true
        
        nextButton.isHidden = true
        
        // ボタンを有効化
        enableButtons()
        
        print(randNum)
    }
    //---------------------------------------------------
}
