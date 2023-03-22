//
//  ViewController.swift
//  SpeedyWritales
//
//  Created by Julia Petersson  on 2023-03-20.
//

import UIKit

class ViewController: UIViewController {

    

    var difficultValues = [String]()
    var choosenDifficulty : String = "easy"

    @IBOutlet weak var HighScoreView: UIScrollView!
    
    
    let segueIdStartGame = "startGame"
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
     //val för svårighet
        difficultValues.append("easy")
        difficultValues.append("medium")
        difficultValues.append("hard")
  
        
    }
    

    


    

    @IBAction func startButton(_ sender: UIButton) {
        
        performSegue(withIdentifier: segueIdStartGame, sender: self)
        
        
        
        
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
       
        if let gameViewController = segue.destination as? GameViewController{
          gameViewController.difficulty = choosenDifficulty
            
        }
    }

    
    
    
}

