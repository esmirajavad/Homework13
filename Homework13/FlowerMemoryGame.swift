//  Homework 13
//  FlowerMemoryGame.swift (ViewModel)
//

import SwiftUI

class FlowerMemoryGame: ObservableObject {
    
    @Published private var model: MemoryGame = CreateMemoryGame()
    
    static func CreateMemoryGame() -> MemoryGame {
        return MemoryGame(numberOfPairsOfCards: 6, contentFactory: makeContent)
    }
    
    static func makeContent(index: Int) -> String {
        
        let images = [
            "flower1", "flower2", "flower3", "flower4", "flower5", "flower6",
            "flower7", "flower8", "flower9", "flower10", "flower11", "flower12"
        ]
        return images[index]
        
    }
    
    
    var cards: Array<MemoryGame.Card> {
        model.cards
    }
    
    var pairs: Int {
        model.numberOfPairs
    }
    
    // Property for tracking how many pairs have been matched in the game.
    /* It loops through all cards, counts the matched ones, and divides by 2
     because each pair contains two cards */
    var matchedPairs: Int {
            var matchedCards = 0
            for card in model.cards {
                if card.isMatched { matchedCards += 1 }
            }
            return matchedCards / 2
        }
    
    
    
    func choose(_ card:MemoryGame.Card) {
        model.chooseCard(card)
    }
    
    
    
   
    
}
