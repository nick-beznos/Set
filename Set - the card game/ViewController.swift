//
//  ViewController.swift
//  Set - the card game
//
//  Created by Nick Beznos on 1/24/19.
//  Copyright © 2019 Nick Beznos. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
   
    private var game: Set!
    
    @IBAction private func touchDealTreeCards(_ sender: UIButton) {
        
    }
    
    @IBAction private func touchNewGame(_ sender: UIButton) {
       // startNewGame()
    }
    @IBOutlet private weak var scoreLabel: UILabel!
    @IBOutlet private var cardButtons: [UIButton]!
    

    @IBAction private func touchCard(_ sender: UIButton) {
        if let cardIndex = cardButtons.index(of: sender) {
            game.selectACard(at: cardIndex)

        }
    }
    
    var cardsOnCreen = [Card]()
    
    
    //MARK: - startNewGame()
//    func startNewGame() {
//        for button in cardButtons.indices {
//            if cardButtons[button].currentAttributedTitle != nil {
//                cardButtons[button].setAttributedTitle(nil, for: .normal)
//                cardButtons[button].isSelected = false
//                cardButtons[button].layer.borderWidth = 0.0
//            }
//        }
//
//        game = Set()
//        game.newGame()
//        drawCrards(inTotalOf: 12)
//    }

    func drawCrards(inTotalOf: Int) {
        
    }
    
    // Gets an AttributedString to make faces for cards
    private func getCardAttributedString(for card: Card) -> NSAttributedString {
        var attributes : [NSAttributedString.Key: Any]
        let cardColor = getCardColor(for: card)
        let cardTitle = getCardTitle(for: card)
        let cardStroke = getCardStroke(for: card)
        
        attributes[NSAttributedString.Key.strokeColor] = cardColor
        attributes[NSAttributedString.Key.strokeWidth] = cardStroke
        
        return NSAttributedString(string: cardTitle, attributes: attributes)
    }

    
    private func getCardTitle(for card: Card) -> String {
        var cardTitle = ""
        
        for _ in 0..<card.number.rawValue {
            cardTitle += card.shape.rawValue
        }
        return cardTitle
    }
    
    private func getCardStroke(for card: Card) -> Double {
        var cardStroke = 0.0
        
        switch card.shading {
        case .striped:
            break
        case .solid:
            cardStroke = 5.0
        case .open:
            cardStroke = 20.0
        }
        return cardStroke
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
    
    
    
    
    
    
    
    
    override var preferredStatusBarStyle : UIStatusBarStyle {
        return .lightContent
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
      
       // startNewGame()
    }


}

