//
//  EmojiMemoryGameView.swift
//  Memorize
//
//  Created by Nikita Stambul on 6/3/24.
//

import SwiftUI

struct EmojiMemoryGameView: View {
    @ObservedObject var viewModel: EmojiMemoryGame
    private let cardAspectRatio: CGFloat = 2/3
    
    var body: some View {
        VStack {
            title
            cards
                .animation(.default, value: viewModel.cards)

            Button("Shuffle") {
                viewModel.shuffle()
            }
        }
        .padding()
    }
    
    private var title: some View {
        Text("Memorize!")
            .font(.largeTitle)
    }
    
    private var cards: some View {
        AspectVGrid(viewModel.cards, aspectRatio: cardAspectRatio) { card in
            CardView(card)
                .padding(4)
                .onTapGesture {
                    viewModel.choose(card)
                }
        }
        .foregroundStyle(.orange)
    }
}

    
    


#Preview {
    EmojiMemoryGameView(viewModel: EmojiMemoryGame())
}
