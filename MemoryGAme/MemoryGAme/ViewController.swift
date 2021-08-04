//
//  ViewController.swift
//  MemoryGAme
//
//  Created by Анна Качкаева on 21.07.2021.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var cardCollection: [UIButton]!

    
    
    private lazy var game = MemoGame(numberOfPairsOfCards: numberOfPairsOfCards)
    
    var numberOfPairsOfCards: Int {
            return ((cardCollection.count + 1) / 2)
    }


    @IBAction private func restartButton(_ sender: UIButton) {
        restartView()
        game.restart()
        
        //updateViewFromModel()
    }

    @IBOutlet private weak var Lable: UILabel!
    
    @IBAction private func cardToched(_ sender: UIButton) {
        if let cardIndex = cardCollection.firstIndex(of: sender){
            game.chooseCard(at: cardIndex)
            updateViewFromModel()
            if cardCollection[cardIndex].backgroundColor != #colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 0) {
                touches+=1
            }
        }
        
    }
    
    private var touches = 0 {
        didSet{
            Lable.text = "touches: \(touches)"
        }
    }
    
    private var emojiCollection = ["🔥", "🌞", "❄️", "🍄", "🍀", "🐁", "🐙", "🐶"]
    
    
    private func updateViewFromModel() {
        for index in cardCollection.indices {
            let button = cardCollection[index]
            let card = game.cards[index]
            
            if card.isTurnedUP {
                button.setTitle(emoji(for: card), for: .normal)
                button.backgroundColor = #colorLiteral(red: 0.3332974017, green: 0.3333514929, blue: 0.3332900405, alpha: 1)
            } else {
                button.setTitle("", for: .normal)
                button.backgroundColor = card.isMatch ? #colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 0) : #colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1)
            }
        }
    }
    
    
    private func restartView() {
        for index in cardCollection.indices {
            let button = cardCollection[index]
            
            button.setTitle("", for: .normal)
            button.backgroundColor = #colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1)
            touches = 0
        }
    }
    
    
    private var emoji = Dictionary<Int, String>()
    
    
    private func emoji(for card: Card) -> String {
        if emoji[card.identifier] == nil, emojiCollection.count > 0 {
            let someInt = Int.random(in: emojiCollection.indices)
            emoji[card.identifier] = emojiCollection.remove(at: someInt)
        }
        
        return emoji[card.identifier] ?? "?"
    }
}

