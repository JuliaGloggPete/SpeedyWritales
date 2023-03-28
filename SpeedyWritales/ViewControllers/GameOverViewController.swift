//
//  GameOverViewController.swift
//  SpeedyWritales
//
//  Created by Julia Petersson  on 2023-03-22.
//

import UIKit

class GameOverViewController: UIViewController {
    
    var scoredPoints = 0
    var playerName : String = ""
    var difficultyPlayed = ""
    let defaults = UserDefaults.standard
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var highScoreLabel: UILabel!
    
    @IBOutlet weak var yourScoreLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        yourScoreLabel.text = "Score: \(scoredPoints) in setting \(difficultyPlayed)"
        
     
        
        if let value = defaults.value(forKey: "MyHighscore") as? String {
            
            
            highScoreLabel.text =  value
            
        }
        
    }
    
    @IBAction func SaveToHighscore(_ sender: UIButton) {
        playerName = nameTextField.text ?? ""
        
       let newScore = "\(scoredPoints)points ...\(playerName) in setting \(difficultyPlayed)"
        

        if var highscore = defaults.object(forKey: "MyHighscore") as? [String] {
            if !highscore.contains(newScore) {
                highscore.append(newScore)
                defaults.set(highscore, forKey: "MyHighscore")
                
                print(highscore)
            }
            //defaults.set("\(playerName) Score \(scoredPoints) in set \(difficultyPlayed)", forKey: "Highscore")
        } else {
            
            defaults.set([newScore], forKey: "MyHighscore")
            print(newScore)
            
            
        }
      
        
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
