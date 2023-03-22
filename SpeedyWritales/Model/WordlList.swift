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
        let wordStrings = ["apple", "banana", "grape", "yogurt", "algorithm", "chandelier", "pneumonia", "saxophone", "fascinating"]
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
    
}
