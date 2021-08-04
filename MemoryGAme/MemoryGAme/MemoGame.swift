//
//  MemoGame.swift
//  MemoryGAme
//
//  Created by Анна Качкаева on 22.07.2021.
//

import Foundation


struct MemoGame {
    private(set) var cards : Array<Card> = []
    
    private var indexOfOneOnlyFaceUp : Int? {
        get{
            var foundIndex: Int?
            for index in cards.indices {
                if cards[index].isTurnedUP {
                    if foundIndex == nil {
                        foundIndex = index
                    } else {
                        return nil
                    }
                }
            }
            return foundIndex
        }
        set {
            for index in cards.indices {
                cards[index].isTurnedUP = (index == newValue)
            }
        }
    }
    
    mutating func chooseCard(at index: Int){
        assert(cards.indices.contains(index), "Concentration.chooseCard(at \(index)): index is invalid")
        if !cards[index].isMatch{
            if let matchIndex = indexOfOneOnlyFaceUp, matchIndex != index {
                if cards[matchIndex].identifier == cards[index].identifier{
                    cards[matchIndex].isMatch = true
                    cards[index].isMatch = true
                }
                cards[index].isTurnedUP = true
            } else {
                indexOfOneOnlyFaceUp = index
            }
        }
    }
    
    mutating func restart() {
        for flipDownIndex in cards.indices {
            cards[flipDownIndex].isTurnedUP = false
            cards[flipDownIndex].isMatch = false
        }
                
        var shufflededCards = [Card]()
        var supportingArray = cards
        
        for _ in 0 ..< cards.count {
            let i = Int.random(in: supportingArray.indices)
            shufflededCards.append(supportingArray[i])
            supportingArray.remove(at: i)
        }
        
        cards = shufflededCards
    }
    
    init(numberOfPairsOfCards: Int) {
        assert((numberOfPairsOfCards > 0), "Concentration.init(\(numberOfPairsOfCards)):  is invalid")

        //creating array of cards
        for _ in 0..<numberOfPairsOfCards {
            let card = Card()
            cards += [card, card]
        }
        
        
        
        //shuffling cards
        let numOfCards = numberOfPairsOfCards*2
        
        var shufflededCards = [Card]()
        var supportingArray = cards
        
        for _ in 0 ..< numOfCards {
            let i = Int.random(in: supportingArray.indices)
            shufflededCards.append(supportingArray[i])
            supportingArray.remove(at: i)
        }
        
        cards = shufflededCards
                
    }
    
}
