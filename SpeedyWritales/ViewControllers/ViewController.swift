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
        self.highscoreTableView.layer.cornerRadius = 10.0
        // Do any additional setup after loading the view.
        
        //val för svårighet
        difficultValues.append("easy")
        difficultValues.append("medium")
        difficultValues.append("hard")
        
        highscoreTableView.dataSource = self
        highscoreTableView.delegate = self
        highscoreTableView.register(UITableViewCell.self, forCellReuseIdentifier: "HighscoreCell")
        
        loadHighScores()
        
        
        
        
        
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return highScores.count
    }
    
    override func viewWillAppear(_ animated: Bool) {
        loadHighScores()
        highscoreTableView.reloadData()
        // om func inte körs så kolla - 
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "HighscoreCell", for: indexPath)
        cell.textLabel?.text = highScores[indexPath.row]
        return cell
    }
    
    
    func loadHighScores() {
        if let scores = UserDefaults.standard.array(forKey: "MyHighscore") as? [String] {
            let sortedScores = scores.sorted(by: { score1, score2 in
                let scoreComponents1 = score1.split(separator: "points")
                let scoreComponents2 = score2.split(separator: "points")
                guard let scoreString1 = scoreComponents1.first, let scoreString2 = scoreComponents2.first else {
                    return false // if any score string is invalid, don't sort
                }
                guard let score1 = Int(scoreString1), let score2 = Int(scoreString2) else {
                    return false // if any score string can't be converted to an integer, don't sort
                }
                return score1 > score2 // sort in descending order
            })
            highScores = sortedScores
        }}
    
    
    
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
    
    @IBAction func unwindToStard(segue: UIStoryboardSegue )
    
    { //highscoreTableView.reloadData()
        
    }
    
    
}

