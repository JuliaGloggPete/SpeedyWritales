//
//  ViewController.swift
//  SpeedyWritales
//
//  Created by Julia Petersson  on 2023-03-20.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var highscoreTableView: UITableView!
    
    

    var difficultValues = [String]()
    var choosenDifficulty : String = "easy"
    var highScores = [String]()

  //  @IBOutlet weak var HighScoreView: UIScrollView!
    
    
    let segueIdStartGame = "startGame"
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
     //val för svårighet
        difficultValues.append("easy")
        difficultValues.append("medium")
        difficultValues.append("hard")
        
        highscoreTableView.dataSource = self
        highscoreTableView.delegate = self
        highscoreTableView.register(UITableViewCell.self, forCellReuseIdentifier: "HighscoreCell")
        
      /*  if let highScores = UserDefaults.standard.object(forKey: "Highscore") as?
            [String] {
                   print("High scores:")
                   for score in highScores {
                       print(score)
                   }
               }*/
        
        if let scores = UserDefaults.standard.array(forKey: "Highscore") as? [String] {
             highScores = scores
         }
         
       
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return highScores.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "HighscoreCell", for: indexPath)
        cell.textLabel?.text = highScores[indexPath.row]
        return cell
    }

    

    func numberOfComponents(in pickerView: UIPickerView) -> Int {
       return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return difficultValues.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
       return difficultValues[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {

        choosenDifficulty = difficultValues[row]
        print(choosenDifficulty)
        
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

