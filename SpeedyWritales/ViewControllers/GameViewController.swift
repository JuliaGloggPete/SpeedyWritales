//
//  GameViewController.swift
//  SpeedyWritales
//
//  Created by Julia Petersson  on 2023-03-20.
//

import UIKit

class GameViewController: UIViewController {

    
    var difficulty : String = "medium"
    
    @IBOutlet weak var shownWord: UILabel!
    
    
    @IBOutlet weak var inputText: UITextField!
    
    
    var wordlist = WordList()
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
 
        
        let randomWord = wordlist.getRandomWord()
        shownWord.text = randomWord.word
        
        
        compareWords(givenWord: shownWord.text ?? <#default value#>, typedWord: inputText.text ?? "")
        

        // Do any additional setup after loading the view.
    }
    
    
    func compareWords(givenWord : String, typedWord: String){
        
        if inputText.text == shownWord.text {
            let randomWord = wordlist.getRandomWord()
            shownWord.text = randomWord.word
            
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
