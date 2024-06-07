//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Nikita Stambul on 6/5/24.
//

import SwiftUI

class EmojiMemoryGame: ObservableObject {
    private static let emojis = ["👻", "💀", "🕷️", "🎃", "🕸️", "🧙", "🍭", "😱", "🙀", "😈", "👹", "☠️"]
    
    private static func createMemoryGame() -> MemoryGame<String> {
        return MemoryGame(numberOfPairsOfCards: 4) { pairIndex in
            if emojis.indices.contains(pairIndex) {
                return emojis[pairIndex]
            } else {
                return "⁉️"
            }
        }
    }
    
    @Published private var memoryGame = createMemoryGame()
    
    var cards: [MemoryGame<String>.Card] {
        memoryGame.cards
    }
    
    // MARK: - Intents
    
    func choose(_ card: MemoryGame<String>.Card) {
        memoryGame.choose(card)
    }
    
    func shuffle() {
        memoryGame.shuffle()
    }
}
