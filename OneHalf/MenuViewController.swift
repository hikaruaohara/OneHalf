//
//  MenuViewController.swift
//  OneHalf
//
//  Created by 青原光 on 2022/03/19.
//

import UIKit
import GameKit

class MenuViewController: UIViewController, GKGameCenterControllerDelegate {
    
    func gameCenterViewControllerDidFinish(_ gameCenterViewController: GKGameCenterViewController) {
        self.dismiss(animated: true)
    }

    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var probabilityLabel: UILabel!
    
    @IBAction func playButton(_ sender: Any) {
        // Hapticを再生
        impactGen.impactOccurred()
    }
    @IBAction func rankingButton(_ sender: Any) {
        // Hapticを再生
        impactGen.impactOccurred()
        let gcView = GKGameCenterViewController(leaderboardID: "bestscore", playerScope: .global, timeScope: .allTime)
        gcView.gameCenterDelegate = self
        present(gcView, animated: true, completion: nil)
    }
    
    // Haptic Feedbackを使用するための宣言
    let impactGen = UIImpactFeedbackGenerator(style: .medium)
    let notificationGen = UINotificationFeedbackGenerator()
    
    let localPlayer = GKLocalPlayer.local
    func authenticateLocalPlayer() {
        localPlayer.authenticateHandler = {(viewController, error) -> Void in
        if (viewController != nil) {
            self.present(viewController!, animated: true, completion: nil)
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Haptic Feedbackの遅延をなくすためのコード
        impactGen.prepare()
        notificationGen.prepare()
        
        authenticateLocalPlayer()
        
        let bestScore = userDefaults.object(forKey: "BestScore") as! Int
        scoreLabel.text = String(bestScore)

        var probability = 100 / pow(2.0, Double(bestScore))
        probability = round(probability * 100) / 100
        probabilityLabel.text = String(probability)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
