//
//  CardView.swift
//  Memorize
//
//  Created by Nikita Stambul on 6/3/24.
//

import SwiftUI

struct CardView: View {
    typealias Card = MemoryGame<String>.Card
    let card: Card

    var body: some View {
        TimelineView(.animation(minimumInterval: 1/10)) { timeline in
            if card.isFaceUp || !card.isMatched {
                Pie(endAngle: .degrees(card.bonusPercentRemaining * 360))
                    .opacity(Constants.Pie.opacity)
                    .overlay(cardContents.padding(Constants.Pie.inset))
                    .padding(Constants.inset)
                    .cardify(isFaceUp: card.isFaceUp)
                    .transition(.scale)
            } else {
                Color.clear
            }
        }
    }
    
    var cardContents: some View {
        Text(card.content)
            .font(.system(size: Constants.FontSize.largest))
            .minimumScaleFactor(Constants.FontSize.scaleFactor)
            .aspectRatio(1, contentMode: .fit)
            .multilineTextAlignment(.center)
            .rotationEffect(.degrees(card.isMatched ? 360 : 0))
            .animation(.spin(duration: 1), value: card.isMatched)
    }
    
    init(_ card: Card) {
        self.card = card
    }
    
    private struct Constants {
        static let inset: CGFloat = 6
        private init() {}
        struct FontSize {
            static let largest: CGFloat = 200
            static let smallest: CGFloat = 10
            static let scaleFactor = smallest / largest
            private init() {}
        }
        struct Pie {
            static let opacity: CGFloat = 0.5
            static let inset: CGFloat = 6
            private init() {}
        }
    }
}

extension Animation {
    static func spin(duration: TimeInterval) -> Animation {
        .linear(duration: 1).repeatForever(autoreverses: false)
    }
}

#Preview {
    typealias Card = CardView.Card
    
    return VStack {
        HStack {
            CardView(Card(isFaceUp: true, content: "👻", id: "1a"))
//            CardView(Card(content: "X", id: "2a"))
            CardView(Card(isFaceUp: false, content: "X", id: "1a"))
        }
        HStack {
            CardView(Card(isFaceUp: true, content: "This is a very long string and I hope it's fits", id: "1a"))
            CardView(Card(isMatched: true, content: "X", id: "2a"))
        }
    }
    .foregroundStyle(.orange)
    .padding()
}
