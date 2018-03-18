//
//  ViewController.swift
//  Concentration
//
//  Created by longxingyu on 11/03/2018.
//  Copyright © 2018 longxingyu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    //create amounts of pair cards.
    lazy var game: Concentration = Concentration(numberOfPairsOfCards: cardButtons.count/2)
    var flipCount = 0 {
        didSet {
            flipCountLabel.text = "Flips:\(flipCount)"
        }
    }

    @IBOutlet weak var flipCountLabel: UILabel!
    @IBOutlet var cardButtons: [UIButton]!
    @IBAction func touchCard(_ sender: UIButton) {
        flipCount += 1
        if let cardNumber = cardButtons.index(of: sender){
            game.chooseCard(at: cardNumber)
            updateViewFromModel()
        } else {
            print("choose card was not in cardButtons")
        }
    }
    
    //update view(flip or not)
    func updateViewFromModel(){
        for index in cardButtons.indices{
            let button  = cardButtons[index]
            let card = game.cards[index]
            if card.isFaceup {
                button.setTitle(emoji(for: card), for: UIControlState.normal)
                button.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            } else {
                button.setTitle("", for: UIControlState.normal)
                button.backgroundColor = card.isMatched ? #colorLiteral(red: 1, green: 0.5763723254, blue: 0, alpha: 0) : #colorLiteral(red: 1, green: 0.5763723254, blue: 0, alpha: 1)
            }
        }
    }
    var emojiChoices = ["💩","👽","🤔","😄","😂","🤷‍♂️"]
//define dictionary   var emoji: Dictionary<Int, String>
    var emoji = [Int: String]()
    
    // add emoji into dictionary "emoji" and return emoji
    func emoji(for card: Card) -> String{
        
        if emoji[card.identifier] == nil, emojiChoices.count > 0{
            let randomIndex = Int(arc4random_uniform(UInt32(emojiChoices.count)))
            //removed the emoji and add in dictionary
            emoji[card.identifier] = emojiChoices.remove(at: randomIndex)
        }
        
        //        if emoji[card.identifier] != nil{
        //            return emoji[card.identifier]!
        //        } else {
        //            return "?"
        //        }
        //         = return emoji[card.identifier] ?? "?"
        
        return emoji[card.identifier] ?? "?"
    }
    
}

