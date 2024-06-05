//
//  CardView.swift
//  Memorize
//
//  Created by Nikita Stambul on 6/3/24.
//

import SwiftUI

struct CardView: View {
    let content: String
    @State private var isFacedUp = false
    
    var body: some View {
        ZStack {
            let base = RoundedRectangle(cornerRadius: 10)

            if isFacedUp {
                base.fill(.white)
                base.strokeBorder(lineWidth: 4)
                Text(content).font(.largeTitle)
            } else {
                base.fill()
            }
        }
        .onTapGesture {
            isFacedUp.toggle()
        }
    }
}

#Preview {
    CardView(content: "🤯")
}
