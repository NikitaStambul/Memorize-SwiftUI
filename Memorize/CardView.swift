//
//  CardView.swift
//  Memorize
//
//  Created by Nikita Stambul on 6/3/24.
//

import SwiftUI

struct CardView: View {
    var isFacedUp: Bool = false
    
    var body: some View {
        ZStack {
            if isFacedUp {
                RoundedRectangle(cornerRadius: 10)
                    .foregroundStyle(.white)
                RoundedRectangle(cornerRadius: 10)
                    .strokeBorder(lineWidth: 4)
                Text("👻")
                    .font(.largeTitle)
            } else {
                RoundedRectangle(cornerRadius: 10)
            }
        }
    }
}

#Preview {
    CardView(isFacedUp: true)
}
