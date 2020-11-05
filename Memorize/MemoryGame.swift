//
//  MemoryGame.swift
//  Memorize
//
//  Created by Matheus Cardoso on 24/09/20.
//

import Foundation

struct MemoryGame<CardContent> {
    var cards: Array<Card>
    
    init(numberOfPairs: Int, cardContentFactory: (Int) -> CardContent) {
        cards = Array<Card>()
        for index in 0..<numberOfPairs {
            let content = cardContentFactory(index)
            cards.append(Card(id: index*2, content: content))
            cards.append(Card(id: index*2+1, content: content))
        }
        cards.shuffle()
    }
    
    mutating func choose(card: Card) {
        print("Card chosen \(card)")
        let indexCard: Int = index(of: card)
        cards[indexCard].isFaceUp = !cards[indexCard].isFaceUp
    }
    
    func index(of card: Card) -> Int {
        for index in 0..<cards.count {
            if cards[index].id == card.id {
                return index
            }
        }
        return -1
    }
    
    struct Card: Identifiable {
        var id: Int
        var content: CardContent
        var isFaceUp: Bool = true
        var isMatched: Bool = false
    }

}

