//
//  Card.swift
//  Concentration
//
//  Created by longxingyu on 18/03/2018.
//  Copyright © 2018 longxingyu. All rights reserved.
//

import Foundation

/*
 two major difference between Struct and Class
 1. struct do not have inheritance
 2. struct is "value" type (be copied), class is "reference" type
 */
struct Card
{
    var isFaceup = false
    var isMatched = false
    var identifier: Int
    static var identifierFactory = 0
    static func getUniqueIdentifier()->Int{
        identifierFactory += 1
        return identifierFactory
    }
    init() {
        self.identifier = Card.getUniqueIdentifier()
    }
}
