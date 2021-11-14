//
//  ViewController.swift
//  OneHalf
//
//  Created by 青原光 on 2021/11/11.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var countLabel: UILabel!
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
            
            count += 1
        } else {
            // Hapticを再生
            notificationGen.notificationOccurred(.error)
            
            // crossを表示
            imageView.image = UIImage(named: "cross")
            imageView.isHidden = false
            
            count = 0
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
            
            count += 1
        } else {
            // Hapticを再生
            notificationGen.notificationOccurred(.error)
            
            // crossを表示
            imageView.image = UIImage(named: "cross")
            imageView.isHidden = false
            
            count = 0
        }
    }
    @IBAction func tappedNext(_ sender: Any) {
        // Hapticを再生
        impactGen.impactOccurred()
        
        viewDidLoad()
    }
    
    let impactGen = UIImpactFeedbackGenerator(style: .medium)
    let notificationGen = UINotificationFeedbackGenerator()
                                 
    var randNum = 0
    var count = 0
    
    func disableButtons() {
        button1.isEnabled = false
        button2.isEnabled = false
    }
    
    
    override var shouldAutorotate: Bool {
        return false
    }
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return .portrait
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        impactGen.prepare()
        notificationGen.prepare()
        
        randNum = Int.random(in: 1 ... 2)
        
        countLabel.text = "Score: " + String(count)
        
        imageView.isHidden = true
        
        // ボタンを有効化
        button1.isEnabled = true
        button2.isEnabled = true
        
        print(randNum)
    }
}
