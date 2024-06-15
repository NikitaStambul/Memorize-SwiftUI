//
//  EmojiMemoryGameView.swift
//  Memorize
//
//  Created by Nikita Stambul on 6/3/24.
//

import SwiftUI

struct EmojiMemoryGameView: View {
    typealias Card = MemoryGame<String>.Card
    @ObservedObject var viewModel: EmojiMemoryGame
    private let cardAspectRatio: CGFloat = 2/3
    private let spacing: CGFloat = 4
    
    var body: some View {
        VStack {
            title
            cards
                .foregroundStyle(viewModel.color)

            HStack {
                score
                Spacer()
                shuffle
            }
            .font(.largeTitle)
        }
        .padding()
    }
    
    private var score: some View {
        Text("Score: \(viewModel.score)")
            .animation(nil)
    }
    
    private var shuffle: some View {
        Button("Shuffle") {
            withAnimation {
                viewModel.shuffle()
            }
        }
    }
    
    private var title: some View {
        Text("Memorize!")
            .font(.largeTitle)
    }
    
    private var cards: some View {
        AspectVGrid(viewModel.cards, aspectRatio: cardAspectRatio) { card in
            CardView(card)
                .padding(spacing)
                .overlay(FlyingNumber(scoreChange(causedBy: card)))
                .onTapGesture {
                    withAnimation {
                        viewModel.choose(card)
                    }
                }
        }
    }
    
    private func scoreChange(causedBy card: Card) -> Int {
        0
    }
}

    
    


#Preview {
    EmojiMemoryGameView(viewModel: EmojiMemoryGame())
}
