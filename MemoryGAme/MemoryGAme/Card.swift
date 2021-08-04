//
//  Card.swift
//  MemoryGAme
//
//  Created by Анна Качкаева on 22.07.2021.
//

import Foundation


struct Card {
    var isTurnedUP = false
    var isMatch = false
    var identifier = 0
    
    private static var identificator = 0
    
    private static func getUniqueIdetifier() -> Int {
        identificator += 1
        return identificator
    }
    
    
    
    init() {
        self.identifier = Card.getUniqueIdetifier()
    }
}
