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

    
    @IBAction func touchDealTreeCards(_ sender: UIButton) {
        game.dealThreeCards()
        drawCrards(inTotalOf: 3)
    }
    
    @IBAction func touchNewGame(_ sender: UIButton) {
        startNewGame()
    }
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet var cardButtons: [UIButton]!
    

    @IBAction func touchCard(_ sender: UIButton) {
                if let cardNumber = cardButtons.index(of: sender) {
                    if game.comparedCards.count <= 2 {
            if cardButtons[cardNumber].currentAttributedTitle != nil {
                cardButtons[cardNumber].isSelected = !cardButtons[cardNumber].isSelected
            }
                    
            if cardButtons[cardNumber].isSelected {
                cardButtons[cardNumber].layer.borderWidth = 3.0
                cardButtons[cardNumber].layer.borderColor = UIColor.gray.cgColor
                
                for card in cardsOnCreen {
                    if card.identifier == Int(cardButtons[cardNumber].currentTitle!) {
                        game.comparedCards.append(card)
                    }
                }
                
            } else {
                cardButtons[cardNumber].layer.borderWidth = 0.0
            }
                    } else {
//                        if game.checkSet() {
//                            //TODO: - Implement selecting feature
//                        }
                    }
        }
    }
    
    var cardsOnCreen = [Card]()
    
    // MARK: - making faces for cards
    let shapes = [" ▲ ", " ● ", " ■ "]
    var faces = [Card:String]()

    func face(for card: Card) -> NSMutableAttributedString {
        
            var attributes: [NSAttributedString.Key: Any] = [:]
            var string = ""
        var attributedString = NSMutableAttributedString(string: string, attributes: attributes)
            
            if card.color == 0 {
                attributes[.foregroundColor] = UIColor.red
            } else if card.color == 1{
                attributes[.foregroundColor] = UIColor.green
            } else {
                attributes[.foregroundColor] = UIColor.purple
            }
            
            if card.shape == 0 {
                string = shapes[0]
                attributedString.mutableString.setString(string)
            } else if card.shape == 1 {
                string = shapes[1]
                attributedString.mutableString.setString(string)
            } else {
                string = shapes[2]
                attributedString.mutableString.setString(string)
            }
            
            if card.number == 1 {
                string += string
                attributedString.mutableString.setString(string)
            } else if card.number == 2 {
                string = string + string + string
                attributedString.mutableString.setString(string)
            }
        
            if card.shading == 0 {
                attributes[.strokeWidth] = 20.0
            } else if card.shading == 1 {
                attributes[.strokeWidth] = 5.0
            } 
        
        attributedString = NSMutableAttributedString(string: string, attributes: attributes)
            
        return attributedString
    }
    
    
    //MARK: - startNewGame()
    func startNewGame() {
        for button in cardButtons.indices {
            if cardButtons[button].currentAttributedTitle != nil {
                cardButtons[button].setAttributedTitle(nil, for: .normal)
                cardButtons[button].isSelected = false
                cardButtons[button].layer.borderWidth = 0.0
            }
        }
        
        game = Set()
        game.newGame()
        drawCrards(inTotalOf: 12)
        
    }
    
    func drawCrards(inTotalOf: Int) {
        for _ in 0..<inTotalOf {
            for button in cardButtons.indices {
                if cardButtons[button].currentAttributedTitle == nil {
                    if !game.dealedCards.isEmpty {
                        let card = game.dealedCards.removeLast()
                        cardsOnCreen.append(card)
                        cardButtons[button].setAttributedTitle(face(for: card), for: .normal)
                        // WARNING! КОСТЫЛЬ!
                        cardButtons[button].setTitle(String(card.identifier), for: .normal)
                    }
                }
            }
        }
    }
    
    
    
    
    
    
    
    override var preferredStatusBarStyle : UIStatusBarStyle {
        return .lightContent
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
      
        startNewGame()
    }


}

