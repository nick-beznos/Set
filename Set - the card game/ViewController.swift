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
    }
    @IBAction func touchNewGame(_ sender: UIButton) {
        startNewGame()
    }
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet var cardButtons: [UIButton]!
    
    //TODO: - Implement selecting feature
    @IBAction func touchCard(_ sender: UIButton) {
        
//        if let cardNumber = cardButtons.index(of: sender) {
//
//            cardButtons[cardNumber].layer.borderWidth = 3.0
//             cardButtons[cardNumber].layer.borderColor = UIColor.gray.cgColor
//
//        }
    }
    
    
    let shapes = ["▲", "●", "■"]
    var faces = [Card:String]()

    // MARK: - making faces for cards
    func face(for card: Card) -> NSMutableAttributedString {
        
            var attributes: [NSAttributedString.Key: Any] = [:]
            var string = ""
            let attributedString = NSMutableAttributedString(string: string, attributes: attributes)
            
            if card.color == 0 {
//                attributedString.addAttribute(.foregroundColor, value: UIColor.red, range: NSRange(location: 0, length: attributedString.length))
                attributes[.foregroundColor] = UIColor.red
            } else if card.color == 1{
                attributes[.foregroundColor] = UIColor.green

                //attributes = [.foregroundColor: UIColor.green]
            } else {
                attributes[.foregroundColor] = UIColor.purple

                //attributes = [.foregroundColor: UIColor.purple]
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
        // TODO: - fix shading
            if card.shading == 0 {
               // attributedString.addAttribute(.strokeWidth, value: 5.0, range: NSRange(location: 0, length: attributedString.length))
                attributes[.strokeWidth] = 5.0
               
            } else if card.shading == 1 {
               // attributedString.addAttribute(.strokeWidth, value: -5.0, range: NSRange(location: 0, length: attributedString.length))
                attributes[.strokeWidth] = -5.0

               
            } 
            
            
        
        return attributedString
    }
    
    
    
    func startNewGame() {
        game = Set()
        game.newGame()
        
        for index in 0..<(cardButtons.count / 2) {
            let button = cardButtons[index]
            
            let card = game.dealedCards[index]
            button.setAttributedTitle(face(for: card), for: .normal)
            // TODO: - fix no color change
        }
    }
    
    
    
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        UIApplication.shared.statusBarStyle = .lightContent
        setNeedsStatusBarAppearanceUpdate()
        
        
        startNewGame()
    }


}

