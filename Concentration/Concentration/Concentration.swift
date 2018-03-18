//
//  Concentration.swift
//  Concentration
//
//  Created by longxingyu on 18/03/2018.
//  Copyright © 2018 longxingyu. All rights reserved.
//

import Foundation

class Concentration
{
    var cards = [Card]()
    
    var indexOfOneAndOnlyFaceUpCard: Int?
    
    //*** major logic! need to know
    func chooseCard(at index: Int){
        if !cards[index].isMatched{
            if let matchIndex = indexOfOneAndOnlyFaceUpCard, matchIndex != index{
                //check if cards match
                if cards[matchIndex].identifier == cards[index].identifier{
                    cards[matchIndex].isMatched = true
                    cards[index].isMatched = true
                }
                //does not match
                cards[index].isFaceup = true
                indexOfOneAndOnlyFaceUpCard = nil
            } else {
                //either no cards or 2 cards are face up
                for flipDownIndex in cards.indices {
                    cards[flipDownIndex].isFaceup = false
                }
                cards[index].isFaceup = true
                indexOfOneAndOnlyFaceUpCard = index
            }
        }
    }
    //Question?: how to get two similar cards in the view
    init(numberOfPairsOfCards:Int){
        for _ in 1...numberOfPairsOfCards{
            let card = Card()
//            cards.append(card)
//            cards.append(card)
            cards += [card, card]
            //TODO: Shuff the card
        }
    }
}
