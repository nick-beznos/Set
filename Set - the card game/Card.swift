//
//  Card.swift
//  Set - the card game
//
//  Created by Nick Beznos on 1/24/19.
//  Copyright © 2019 Nick Beznos. All rights reserved.
//

import Foundation

struct Card {
   

    var color = 0
    var shape = 0
    var shading = 0
    var number = 0
    var isSelectedCard = false
    
    enum Color {
        case green
        case purple
        case red
        
        static var all : [Color] {
           return [.green, .purple, .red]
        }
    }
    enum Shape: String {
        case triangle = "▲"
        case circle = "●"
        case rectangle = "■"
        
        static var all : [Shape] {
            return [.triangle, .circle, .rectangle]
        }
    }
    enum Shading {
        case full
        case partial
        case circle
        
        static var all : [Shading] {
            return [.full, .partial, .circle]
        }
    }
    enum Number: Int{
        case one = 1
        case two = 2
        case three = 3
        
        static var all : [Number] {
            return [.one, .two, .three]
        }

    }

    
//    init (color: Int, shape: Int, shading: Int, number: Int) {
//        self.color = color
//        self.shape = shape
//        self.shading = shading
//        self.number = number
//    }
}

extension Card : Equatable {
    static func ==(lhs: Card, rhs: Card) -> Bool {
        return
        (lhs.color == rhs.color) &&
        (lhs.shape == rhs.shape) &&
        (lhs.shading == rhs.shading) &&
        (lhs.number == rhs.number)
        
    }
}
