//
//  Card.swift
//  Set - the card game
//
//  Created by Nick Beznos on 1/24/19.
//  Copyright © 2019 Nick Beznos. All rights reserved.
//

import Foundation

struct Card {

    var color : Color
    var shape : Shape
    var shading : Shading
    var number : Number
    
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
        case striped
        case solid
        case open
        
        static var all : [Shading] {
            return [.striped, .solid, .open]
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
