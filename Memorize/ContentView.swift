//
//  ContentView.swift
//  Memorize
//
//  Created by Nikita Stambul on 6/3/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        HStack {
            CardView()
            CardView()
            CardView()
            CardView()
        }
        .padding()
        .foregroundStyle(.orange)
    }
}

#Preview {
    ContentView()
}
