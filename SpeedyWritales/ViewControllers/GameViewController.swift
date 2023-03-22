//
//  GameViewController.swift
//  SpeedyWritales
//
//  Created by Julia Petersson  on 2023-03-20.
//

import UIKit

class GameViewController: UIViewController {
    let segueIdGameOver = "gameOver"
    
    var difficulty : String = "medium"
    
    @IBOutlet weak var shownWord: UILabel!
    
    @IBOutlet weak var timerLabel: UILabel!
    
    @IBOutlet weak var inputText: UITextField!
    
    var countdownSeconds = 60
    var wordlist = WordList()
    var randomWord: Words?
    var timer: Timer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setNewWord()
        timerLabel.text = formatTime(countdownSeconds)
        startTimer()
 
        // så länge en timer pågår så länge ska det funkar
        
       // compareWords(givenWord: shownWord.text ?? "nonono", typedWord: inputText.text ?? "")
    
        inputText.addTarget(self, action: #selector(textDidChange), for: .editingChanged)
        
    }
    
    
    func compareWords(givenWord : String, typedWord: String){
        
        if inputText.text == shownWord.text {
            setNewWord()
            
        }

    }
    
    func setNewWord (){
        randomWord = wordlist.getRandomWord()
        shownWord.text = randomWord?.word
        inputText.text = ""
        
    }
    
    @objc func textDidChange() {
        guard let randomWord = randomWord else { return }
        if inputText.text == randomWord.word {
            setNewWord()
        }
    }
    
    
    
    @objc func updateTimerLabel() {
        countdownSeconds -= 1
        
        timerLabel.text = formatTime(countdownSeconds)

        
        if countdownSeconds == 0 {
            // Stop the timer when the countdown reaches 0
            timer?.invalidate()
            performSegue(withIdentifier: segueIdGameOver, sender: self)
            
        }
    }
    
    func startTimer(){
        
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateTimerLabel), userInfo: nil, repeats: true)
    }
    
    func formatTime(_ seconds: Int) -> String {
        let minutes = seconds / 60
        let remainingSeconds = seconds % 60
        return String(format: "%02d:%02d", minutes, remainingSeconds)
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
