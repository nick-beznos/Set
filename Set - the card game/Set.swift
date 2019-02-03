//
//  Set.swift
//  Set - the card game
//
//  Created by Nick Beznos on 1/24/19.
//  Copyright © 2019 Nick Beznos. All rights reserved.
//

import Foundation

struct Set {
    //TODO: - implement score logic
    var score = 0
    
    var deckOfCards = [Card]()
    var dealedCards = [Card]()
    var comparedCards = [Card]()
    

    var alreadyMathcesdCards: [Card] = []
    
    enum cardAttributes {
        case color(Int)
        case shape(Int)
        case shading(Int)
        case number(Int)
    }
    
    
    mutating func makeADeck(for arrOfCards: [Card]) -> [Card] {
        var cards = arrOfCards
        
        var color = 0
        var shape = 0
        var shading = 0
        var number = 0
        
        while color <= 2 {
            while shape <= 2 {
                while shading <= 2 {
                    while number <= 2 {
                        cards.append(Card(color: color, shape: shape, shading: shading, number: number))
                        number += 1
                    }
                    number = 0
                    shading += 1
                }
                shading = 0
                shape += 1
            }
            shape = 0
            color += 1
        }
        
        cards.shuffle()
        return cards
    }
    
    mutating func dealCards(inTotalOf: Int) -> [Card] {
        var cardsArray = [Card]()
        for _ in 0..<inTotalOf {
            if !deckOfCards.isEmpty{
                cardsArray.append(deckOfCards.removeLast())
            }
        }
        return cardsArray
    }
    
    mutating func newGame() {
        deckOfCards = []
        deckOfCards = makeADeck(for: deckOfCards)
        dealedCards = dealCards(inTotalOf: 12)
    }
    
    mutating func dealThreeCards() {
        if dealedCards.count <= 21 {
        dealedCards += dealCards(inTotalOf: 3)
        }
    }
    
    
//    mutating func checkSet() -> Bool {
//        let card1 = comparedCards[0]
//        let card2 = comparedCards[1]
//        let card3 = comparedCards[2]
// 
//        return true
//    }
    
    
    
}



