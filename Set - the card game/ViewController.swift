//
//  ViewController.swift
//  Set - the card game
//
//  Created by Nick Beznos on 1/24/19.
//  Copyright © 2019 Nick Beznos. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
   
    private var game = Set()
  
    @IBOutlet private weak var dealCardsButton: UIButton!
    @IBOutlet private weak var scoreLabel: UILabel!
    @IBOutlet private var cardButtons: [UIButton]!
    @IBOutlet private weak var newGameButton: UIButton!
    
    @IBAction func touchCheat(_ sender: UIButton) {
        game.cheat()
        updateView()
    }
    @IBAction private func touchDealTreeCards(_ sender: UIButton) {
            game.dealThreeMoreCards()
            updateView()
    }
    @IBAction private func touchNewGame(_ sender: UIButton) {
       game.newGame()
        updateView()
    }
    @IBAction private func touchCard(_ sender: UIButton) {
       
        if let cardIndex = cardButtons.index(of: sender) {
            game.selectACard(at: cardIndex)
            updateView()
        }
    }
    
    
    
    private func updateView() {
        updateScore()
        drawCardButtons()
        dealCardsButton.isEnabled = canDealMoreCards()
        if game.setIsAvailable == false {
            gameOver()
        }
    }
    
    private func updateScore() {
       
        if let label = scoreLabel {
            label.text = "Score: \(game.score)"
        }
    }
    
    private func drawCardButtons() {
       
        let dealtCards = game.dealtCards
       // print(dealtCards)
        // draw button faces for cards on table
        for index in dealtCards.indices {
            let card = dealtCards[index]
            let cardButton = cardButtons[index]
            
            cardButton.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            cardButton.layer.cornerRadius = 8.0
            cardButton.setAttributedTitle(getCardAttributedString(for: card), for: .normal)
            addButtonBorder()
        }
        
        // makes the rest of the buttons clear
        for index in dealtCards.count..<cardButtons.count {
            let cardButton = cardButtons[index]
            
            cardButton.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 0)
            cardButton.setAttributedTitle(NSAttributedString(string: ""), for: .normal)
            cardButton.layer.borderWidth = 0.0
        }
    }
    
    // Gets an AttributedString to make faces for cards
    private func getCardAttributedString(for card: Card) -> NSAttributedString {
        
        var attributes = [NSAttributedString.Key: Any]()
        let cardColor = getCardColor(for: card)
        let cardTitle = getCardTitle(for: card)
        
        switch card.shading {
        case .open:
            
            attributes[NSAttributedString.Key.strokeWidth] = 10.0
            attributes[NSAttributedString.Key.strokeColor] = cardColor
        case .solid:
            attributes[NSAttributedString.Key.foregroundColor] = cardColor.withAlphaComponent(1.0)
        case .striped:
            attributes[NSAttributedString.Key.foregroundColor] = cardColor.withAlphaComponent(0.3)
        }
        
        return NSAttributedString(string: cardTitle, attributes: attributes)
    }

    private func getCardTitle(for card: Card) -> String {
        
        var cardTitle = ""
        for _ in 0..<card.number.rawValue {
            cardTitle += card.shape.rawValue
        }
        return cardTitle
    }
    
    private func getCardColor(for card: Card) -> UIColor {
       
        var cardColor: UIColor
        switch card.color {
        case .red:
            cardColor = .red
        case .green:
            cardColor = .green
        case .purple:
            cardColor = .purple
        }
        return cardColor
    }
    
    private func addButtonBorder() {
        
        let selectedCards = game.selectedCards
        let dealtCards = game.dealtCards
        let cheatCards = game.cheatSet
        
        for index in dealtCards.indices {
            let card = dealtCards[index]
            let cardButton = cardButtons[index]
            
            if cheatCards.contains(card) {
                cardButton.layer.borderWidth = 4.0
                cardButton.layer.borderColor = #colorLiteral(red: 0.3647058904, green: 0.06666667014, blue: 0.9686274529, alpha: 1)
            } else if selectedCards.contains(card) {
                cardButton.layer.borderWidth = 4.0
                
                if selectedCards.count < 3 {
                    cardButton.layer.borderColor = #colorLiteral(red: 1, green: 0.9714247993, blue: 0, alpha: 1)
                } else {
                    cardButton.layer.borderColor = game.hasMatched ? #colorLiteral(red: 0.3793103405, green: 1, blue: 0, alpha: 1) : #colorLiteral(red: 0.9995597005, green: 0, blue: 0, alpha: 1)
                }
            } else {
                cardButton.layer.borderWidth = 0.0
            }
        }
    }
    
    private func canDealMoreCards() -> Bool {
        return game.deckOfCards.count >= 3 && game.dealtCards.count <= 21
    }
    
    private func gameOver(){
        let alert = UIAlertController(title: "There is no possible set!", message: "Your score is \(game.score).", preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "New game", style: .cancel, handler: { action in
            self.game.newGame()
            self.updateView()
        }))
        
        
        self.present(alert, animated: true)
    }
   
    override var preferredStatusBarStyle : UIStatusBarStyle {
        return .lightContent
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // rounding button's corners
        dealCardsButton.layer.cornerRadius = 8.0
        newGameButton.layer.cornerRadius = 8.0
      
       updateView()
    }
}

