//
//  Card.swift
//  Set - the card game
//
//  Created by Nick Beznos on 1/24/19.
//  Copyright © 2019 Nick Beznos. All rights reserved.
//

import Foundation

struct Card: Hashable {
    
    var hashValue: Int { return identifier
    }
    static func ==(lhs: Card, rhs: Card) -> Bool {
        return lhs.identifier == rhs.identifier
    }
    
    var identifier: Int

    var color = 0
    var shape = 0
    var shading = 0
    var number = 0
    var isSelectedCard = false

    private static var identifierFactory = 0
    
    private static func getUniqueIdentifier() -> Int{
        identifierFactory += 1
        return identifierFactory
    }
    
    
    init (color: Int, shape: Int, shading: Int, number: Int) {
        self.color = color
        self.shape = shape
        self.shading = shading
        self.number = number
        self.identifier = Card.getUniqueIdentifier()

    }

}
