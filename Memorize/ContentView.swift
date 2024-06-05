//
//  ContentView.swift
//  Memorize
//
//  Created by Nikita Stambul on 6/3/24.
//

import SwiftUI

struct ContentView: View {
    let emojis = ["👻", "💀", "🕷️", "🎃"]
    
    var body: some View {
        HStack {
            ForEach(emojis, id: \.self) { emoji in
                CardView(content: emoji)
            }
        }
        .padding()
        .foregroundStyle(.orange)
    }
}

#Preview {
    ContentView()
}
