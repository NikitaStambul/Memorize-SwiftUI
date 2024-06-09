//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Nikita Stambul on 6/5/24.
//

import SwiftUI

class EmojiMemoryGame: ObservableObject {
    typealias Card = MemoryGame<String>.Card
    private static let emojis = ["👻", "💀", "🕷️", "🎃", "🕸️", "🧙", "🍭", "😱", "🙀", "😈", "👹", "☠️"]
    
    private static func createMemoryGame() -> MemoryGame<String> {
        return MemoryGame(numberOfPairsOfCards: 2) { pairIndex in
            if emojis.indices.contains(pairIndex) {
                return emojis[pairIndex]
            } else {
                return "⁉️"
            }
        }
    }
    
    @Published private var memoryGame = createMemoryGame()
    
    var cards: [Card] {
        memoryGame.cards
    }
    
    var color: Color {
        .orange
    }
    
    // MARK: - Intents
    
    func choose(_ card: Card) {
        memoryGame.choose(card)
    }
    
    func shuffle() {
        memoryGame.shuffle()
    }
}
