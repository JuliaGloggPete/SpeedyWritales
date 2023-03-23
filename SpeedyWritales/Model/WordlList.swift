//
//  WordlList.swift
//  SpeedyWritales
//
//  Created by Julia Petersson  on 2023-03-21.
//



import Foundation


class WordList {
    
    private var words = [Words]()
    
    
    /*  init() {
     add(word: Words(word: "apple"))
     add(word: Words(word: "banana"))
     add(word: Words(word: "grape"))
     add(word: Words(word: "yogurt"))
     add(word: Words(word: "algorithm"))
     add(word: Words(word: "chandelier"))
     add(word: Words(word: "pneumonia"))
     add(word: Words(word: "saxophone"))
     add(word: Words(word: "fascinating"))
     
     
     }*/
    init() {
        let wordStrings = ["apple", "banana", "grape", "yogurt", "algorithm", "chandelier", "pneumonia", "saxophone", "fascinating","pie","cake","fake","random","code","impressionism","expressionism","restaurant","ok","fine","post","office","women","woman","man","child","room","floor","cookie","fresh","value","multiple","contain", "compound","case","within","switch","unknown","sand","mister","speed"]
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

            
      /*  case "easy":
            
            for word in words {
                if word.word.count <= 5 {
                    let easywords = [word]
                    let randm = Int.random(in: 0..<easywords.count)
                    return easywords[randm]
                    
                }
                
            }
        case "medium":
            for word in words {
                if word.word.count > 5 && word.word.count <= 8 {
                    let mediumwords = [word]
                    
                    let randm = Int.random(in: 0..<mediumwords.count)
                    return mediumwords[randm]
                    
                }
            }
        case "hard":
            
            for word in words {
                if word.word.count >  8 {
                    
                    let hardwords = [word]
                    
                    let randm = Int.random(in: 0..<hardwords.count)
                    return hardwords[randm]
                    
                }
                
                
            }
        default:
         return   getRandomWord()
            
            
        }
    }*/
}
