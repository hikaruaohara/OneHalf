//
//  ViewController.swift
//  OneHalf
//
//  Created by 青原光 on 2021/11/11.
//

import UIKit

class ViewController: UIViewController {
    //-----Outlet接続した変数・関数-----------------------
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var imageView: UIImageView!
    @IBAction func tappedButton1(_ sender: Any) {
        disableButtons()
        
        if (randNum == 1) {
            // Hapticを再生
            impactGen.impactOccurred()
            
            // circleを表示
            imageView.image = UIImage(named: "circle")
            imageView.isHidden = false
            
            score += 1
        } else {
            // Hapticを再生
            notificationGen.notificationOccurred(.error)
            
            // crossを表示
            imageView.image = UIImage(named: "cross")
            imageView.isHidden = false
            
            score = 0
        }
    }
    @IBAction func tappedButton2(_ sender: Any) {
        disableButtons()
        
        if (randNum == 2) {
            // Hapticを再生
            impactGen.impactOccurred()
            
            // circleを表示
            imageView.image = UIImage(named: "circle")
            imageView.isHidden = false
            
            score += 1
        } else {
            // Hapticを再生
            notificationGen.notificationOccurred(.error)
            
            // crossを表示
            imageView.image = UIImage(named: "cross")
            imageView.isHidden = false
            
            score = 0
        }
    }
    @IBAction func tappedNext(_ sender: Any) {
        // Hapticを再生
        impactGen.impactOccurred()
        
        // 画面をロード
        viewDidLoad()
    }
    //-------------------------------------------------
    
    //-----その他の定数・変数・メソッド-------------------------
    // Haptic Feedbackを使用するための宣言
    let impactGen = UIImpactFeedbackGenerator(style: .medium)
    let notificationGen = UINotificationFeedbackGenerator()
    // 乱数
    var randNum = 1
    // 連続して正解した回数
    var score = 0
    // button1とbutton2を無効化するメソッド
    func disableButtons() {
        button1.isEnabled = false
        button2.isEnabled = false
    }
    // 画面をロックするためのコード
    override var shouldAutorotate: Bool {
        return false
    }
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return .portrait
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Haptic Feedbackの遅延をなくすためのコード
        impactGen.prepare()
        notificationGen.prepare()
        
        randNum = Int.random(in: 1 ... 2)
        scoreLabel.text = "Score: " + String(score)
        imageView.isHidden = true
        
        // ボタンを有効化
        button1.isEnabled = true
        button2.isEnabled = true
        
        print(randNum)
    }
    //---------------------------------------------------
}
