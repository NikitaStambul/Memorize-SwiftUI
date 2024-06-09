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
        Pie(endAngle: .degrees(240))
            .opacity(Constants.Pie.opacity)
            .overlay(
                Text(card.content)
                    .font(.system(size: Constants.FontSize.largest))
                    .minimumScaleFactor(Constants.FontSize.scaleFactor)
                    .aspectRatio(1, contentMode: .fit)
                    .multilineTextAlignment(.center)
                    .padding(Constants.Pie.inset)
            )
            .padding(Constants.inset)
            .cardify(isFaceUp: card.isFaceUp)
            .opacity(card.isFaceUp ? 1 : 0)
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

#Preview {
    typealias Card = CardView.Card
    
    return VStack {
        HStack {
            CardView(Card(isFaceUp: true, content: "👻", id: "1a"))
//            CardView(Card(content: "X", id: "2a"))
            CardView(Card(isFaceUp: true, content: "X", id: "1a"))
        }
        HStack {
            CardView(Card(isFaceUp: true, content: "This is a very long string and I hope it's fits", id: "1a"))
            CardView(Card(isMatched: true, content: "X", id: "2a"))
        }
    }
    .foregroundStyle(.orange)
    .padding()
}
