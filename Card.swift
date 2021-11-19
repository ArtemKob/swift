//
//  Card.swift
//  Stanford
//
//  Created by Artem Arhutik on 25.10.21.
//

import Foundation



struct Card {
    
    var isFaceUP = false
    var isMatched = false
    var identifier: Int
    
    
    static var indentifierNumber = 0
    
    static func identifierGenerator() -> Int {
        indentifierNumber += 1
        return indentifierNumber
        
        
    }
    
    init() {
        self.identifier = Card.identifierGenerator()
    }
    
}
