//
//  WordlList.swift
//  SpeedyWritales
//
//  Created by Julia Petersson  on 2023-03-21.
//



import Foundation


class WordList {
    
    private var words = [Words]()
    
    
    
    init() {
        let wordStrings = ["apple", "banana", "grape", "yogurt", "algorithm", "chandelier", "pneumonia", "saxophone", "fascinating","pie","cake","fake","random","code","impressionism","expressionism","restaurant","ok","fine","post","office","women","woman","man","child","room","floor","cookie","fresh","value","multiple","contain", "compound","case","within","switch","unknown","sand","mister","speed","hamburger","onion","opinion","we","nice","superman","batman","spiderman","five","finger","death","punch","comic","mouse","house","spouse","white","black","white","grey","blue","dad","dread","sad"]
        words = wordStrings.map { Words(word: $0) }
    }
    
    
    
    var count : Int {
        
        return words.count
        
    }
    
    
    func add(word : Words) {
        
        words.append(word)
        
    }
    
    func getRandomWord() -> Words {
        let randm = Int.random(in: 0..<words.count)
        return words[randm]
    }
    
    
    func getWordbyDifficulty (difficulty : String) -> Words {
        
        switch difficulty {
            
        case "easy":
            let easywords = words.filter { $0.word.count <= 5 }
            let randm = Int.random(in: 0..<easywords.count)
            return easywords[randm]
            
        case "medium":
            let mediumwords = words.filter { $0.word.count > 6 && $0.word.count <= 8 }
            let randm = Int.random(in: 0..<mediumwords.count)
            return mediumwords[randm]
            
        case "hard":
            let hardwords = words.filter { $0.word.count >= 8  }
            let randm = Int.random(in: 0..<hardwords.count)
            return hardwords[randm]
            
        default:
            return getRandomWord()
        }
    }
    
    
}
