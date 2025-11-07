/*:
 ## CIS137 iOS/SWIFT Programming
 
 ## Homework 13
 
 Students: Esmira Babayeva,
 
 Instructor: Hellen Pacheco
 
 Date: 06 November, 2025
  
 */
//  MemoryGame.swift (Model)



import Foundation


struct MemoryGame {
    
    private(set) var cards: Array<Card>
    private(set) var numberOfPairs: Int
    
    struct Card: Identifiable {
        var content: String
        var isFaceUp: Bool = false
        var isMatched: Bool = false
        var id: Int
    }
    
    mutating func chooseCard (_ card: Card) {
        for index in cards.indices {
            if cards[index].id == card.id {
                cards[index].isFaceUp.toggle()
            }
        }
        
        // Find the indices of all cards that are face-up but not yet matched
        var faceUpIndices: [Int] = []
                for i in 0..<cards.count {
                    if cards[i].isFaceUp && !cards[i].isMatched {
                        faceUpIndices.append(i)
                    }
                }

                // If two cards are face-up, check if they match
        if faceUpIndices.count == 2 {
            let first = faceUpIndices[0]
            let second = faceUpIndices[1]
            if cards[first].content == cards[second].content {
                    cards[first].isMatched = true
                    cards[second].isMatched = true
                    }
                }
            }
    
    
    
    
    
    init(numberOfPairsOfCards: Int, contentFactory: (Int) -> String) {
        cards = []
        numberOfPairs = numberOfPairsOfCards
        
        for index in 0..<numberOfPairsOfCards {
            let content = contentFactory(index)
            cards.append(Card(content: content, id: index * 2))
            cards.append(Card(content: content, id: index * 2 + 1))
        }
        cards.shuffle()
    }
    
}
