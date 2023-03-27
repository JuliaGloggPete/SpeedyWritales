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
        
     
        
        if let value = defaults.value(forKey: "Highscore") as? String {
            
            
            highScoreLabel.text =  value
            
        }
        
    }
    
    @IBAction func SaveToHighscore(_ sender: UIButton) {
        playerName = nameTextField.text ?? ""
        
       let newScore = "\(playerName) Score \(scoredPoints) in set \(difficultyPlayed)"
        

        if var highscore = defaults.object(forKey: "Highscore") as? [String] {
            
            highscore.append(newScore)
            defaults.set(highscore, forKey: "Highscore")
            
            print(highscore)
            
            //defaults.set("\(playerName) Score \(scoredPoints) in set \(difficultyPlayed)", forKey: "Highscore")
        } else {
            
            defaults.set([newScore], forKey: "Highscore")
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
