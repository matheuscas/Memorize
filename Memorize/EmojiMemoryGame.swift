//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Matheus Cardoso on 24/09/20.
//

import SwiftUI

class EmojiMemoryGame: ObservableObject {
    @Published private var model: MemoryGame<String> = EmojiMemoryGame.createMemoryGame()
    
    static func createMemoryGame() -> MemoryGame<String> {
        let emojis: Array<String> = ["👻", "🎃", "🕷", "👹", "🤡", "👽"]
        return MemoryGame<String>(numberOfPairs: Int.random(in: 2...5)) {index in emojis[index]}
    }
    
    // MARK: - Model access
    var cards: Array<MemoryGame<String>.Card> {
        model.cards
    }
    
    // MARK: - User's intents
    func choose(card: MemoryGame<String>.Card) {
        model.choose(card: card)
    }
}
