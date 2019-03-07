//
//  Set.swift
//  Set - the card game
//
//  Created by Nick Beznos on 1/24/19.
//  Copyright © 2019 Nick Beznos. All rights reserved.
//

import Foundation

class Set {

    private(set) var score = 0
    private(set) var time = 0

    
    private(set) var deckOfCards = [Card]()
    private(set) var dealtCards = [Card]()
    private(set) var selectedCards = [Card]()
    private(set) var hasMatched = false
    
    //date
    private var timer = Timer()
    

    //MARK: - funcs
    private func makeADeck() {
        if deckOfCards.count > 0 {
        }

        for number in Card.Number.all {
            for color in Card.Color.all {
                for shape in Card.Shape.all {
                    for shading in Card.Shading.all {
                        deckOfCards.append(Card(
                            color: color,
                            shape: shape,
                            shading: shading,
                            number: number))
                    }
                }
            }
        }
        //MARK: DISABLE FOR TESTING
        deckOfCards = deckOfCards.shuffled()
    }
    
    private  func dealCards(inTotalOf cards: Int) {
        if deckOfCards.count >= cards && dealtCards.count <= 21 {
            for _ in 0..<cards {
                if let drawnCard = deckOfCards.popLast() {
                    dealtCards.append(drawnCard)
                }
            }
        }
    }
    
    // if selected cards are matched, remove them from cardsInPlay
    private  func checkForMatch() -> Bool{
        hasMatched = selectedCardsAreMatch()
        
        if hasMatched {
            for card in selectedCards {
                if let index = dealtCards.index(of: card) {
                    dealtCards.remove(at: index)
                }
            }
        }
        return hasMatched
    }
    
    private func selectedCardsAreMatch() -> Bool{

        if selectedCards.count < 3 {
            return false
        }
        
        let card1 = selectedCards[0]
        let card2 = selectedCards[1]
        let card3 = selectedCards[2]
        
        // check color
        if (!((card1.color == card2.color) && (card1.color == card3.color) || (card1.color != card2.color) && (card1.color != card3.color) && (card2.color != card3.color))) {
            return false
        }
        
        // check shape
        if (!((card1.shape == card2.shape) && (card1.shape == card3.shape) || (card1.shape != card2.shape) && (card1.shape != card3.shape) && (card2.shape != card3.shape))) {
            return false
        }
        
        // check shading
        if (!((card1.shading == card2.shading) && (card1.shading == card3.shading) || (card1.shading != card2.shading) && (card1.shading != card3.shading) && (card2.shading != card3.shading))) {
            return false
        }
        
        // check number
        if (!((card1.number == card2.number) && (card1.number == card3.number) || (card1.number != card2.number) && (card1.number != card3.number) && (card2.number != card3.number))) {
            return false
        }

        return true
    }

    init() {
        makeADeck()
        dealCards(inTotalOf: 12)
        // start a timer
        self.timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true, block: { timer in
            self.timeCount()})
    }
    
     func selectACard(at index: Int) {

        hasMatched = false
        if (index >= 0 && index < dealtCards.count) {
            let card = dealtCards[index]
            // deselect card if it's already been selected and fewer than 3 cards have been selected
            // else select the card
            if selectedCards.count < 3 {
                if let selectedCardIndex = selectedCards.index(of: card) {
                    selectedCards.remove(at: selectedCardIndex)
                } else {
                    selectedCards.append(card)
                    hasMatched = selectedCardsAreMatch()
                }
            } else if selectedCards.count == 3 {
                if checkForMatch() {
                    dealCards(inTotalOf: 3)
                    score = calculateScore()
                    time = 0
                } else {
                    score -= 10
                }
                selectedCards = selectedCards.contains(card) ? [] : [card]
            }
        }
    }
    
     func dealThreeMoreCards() {

        if checkForMatch() {
            selectedCards.removeAll()
        }
        dealCards(inTotalOf: 3)
        score -= 1
    }
    
     func newGame() {
        score = 0
        time = 0
        deckOfCards.removeAll()
        dealtCards.removeAll()
        selectedCards.removeAll()
        hasMatched = false
        
        makeADeck()
        dealCards(inTotalOf: 12)
    }
    
    private  func timeCount() {
        time += 1
        print(time)
    }
    
    private  func calculateScore() -> Int {
        var calcutatedScore = 0
        
        if time <= 5{
            calcutatedScore = 10
        } else if time <= 15 {
            calcutatedScore = 5
        } else {
            calcutatedScore = 2
        }
        return calcutatedScore
    }
}



