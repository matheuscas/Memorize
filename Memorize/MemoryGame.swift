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
    }
    
    func choose(card: Card) {
        print("Card chosen \(card)")
    }
    
    struct Card: Identifiable {
        var id: Int
        var content: CardContent
        var facesUp: Bool = true
        var isMatched: Bool = false
    }

}

