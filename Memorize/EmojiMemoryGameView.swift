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
    
    var body: some View {
        VStack {
            title
            cards
                .foregroundStyle(viewModel.color)

            HStack {
                score
                Spacer()
                deck.foregroundStyle(viewModel.color)
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
        AspectVGrid(viewModel.cards, aspectRatio: Constants.cardAspectRatio) { card in
            if isDealt(card) {
                CardView(card)
                    .padding(Constants.spacing)
                    .overlay(FlyingNumber(scoreChange(causedBy: card)))
                    .zIndex (scoreChange(causedBy: card) != 0 ? 1 : 0)
                    .onTapGesture {
                        choose(card)
                    }
                    .matchedGeometryEffect(id: card.id, in: dealingNamespace)
                    .transition(.asymmetric(insertion: .identity, removal: .identity))
            }
        }
    }
    
    @State private var dealt = Set<Card.ID>()
    
    private func isDealt(_ card: Card) -> Bool {
        dealt.contains(card.id)
    }
    
    private var undealtCards: [Card] {
        viewModel.cards.filter { !isDealt($0) }
    }
    
    @Namespace private var dealingNamespace
    
    private var deck: some View {
        ZStack {
            ForEach(undealtCards) { card in
                CardView(card)
                    .matchedGeometryEffect(id: card.id, in: dealingNamespace)
                    .transition(.asymmetric(insertion: .identity, removal: .identity))
            }
        }
        .frame(width: Constants.deckWidth, height: Constants.deckWidth / Constants.cardAspectRatio)
        .onTapGesture {
            deal()
        }
    }
    
    private func deal() {
        var delay: TimeInterval = 0
        
        for card in viewModel.cards {
            withAnimation(Constants.dealAnimation.delay(delay)) {
                _ = dealt.insert(card.id)
            }

            delay += Constants.dealInterval
        }
    }
    
    @State private var lastScoreChange: (Int, causedByCardId: Card.ID) = (0, "")
    
    private func scoreChange(causedBy card: Card) -> Int {
        let (amount, id) = lastScoreChange
        return card.id == id ? amount : 0
    }
    
    private func choose(_ card: Card) {
        withAnimation {
            let scoreBeforeChoosing = viewModel.score
            viewModel.choose(card)
            let scoreChange = viewModel.score - scoreBeforeChoosing
            lastScoreChange = (scoreChange, card.id)
        }
    }
    
    struct Constants {
        static let cardAspectRatio: CGFloat = 2/3
        static let spacing: CGFloat = 4
        static let dealAnimation = Animation.easeInOut(duration: 1)
        static let deckWidth: CGFloat = 50
        static let dealInterval: TimeInterval = 0.15
        
        private init() {}
    }
}

    
    


#Preview {
    EmojiMemoryGameView(viewModel: EmojiMemoryGame())
}
