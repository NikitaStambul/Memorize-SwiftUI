//
//  CardView.swift
//  Memorize
//
//  Created by Nikita Stambul on 6/3/24.
//

import SwiftUI

struct CardView: View {
    let card: MemoryGame<String>.Card
    
    var body: some View {
        ZStack {
            let base = RoundedRectangle(cornerRadius: 10)

            Group {
                base.fill(.white)
                base.strokeBorder(lineWidth: 4)
                Text(card.content)
                    .font(.system(size: 200))
                    .minimumScaleFactor(0.01)
                    .aspectRatio(1, contentMode: .fit)
            }
            .opacity(card.isFaceUp ? 1 : 0)

            base.fill().opacity(card.isFaceUp ? 0 : 1)
        }
        .opacity(card.isMatched && !card.isFaceUp ? 0 : 1)
    }
    
    init(_ card: MemoryGame<String>.Card) {
        self.card = card
    }
}

#Preview {
    CardView(MemoryGame<String>.Card(content: "👻", id: "1a"))
}
