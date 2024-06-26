//
//  FlyingNumber.swift
//  Memorize
//
//  Created by Nikita Stambul on 6/13/24.
//

import SwiftUI

struct FlyingNumber: View {
    let number: Int
    @State private var offset = Constants.startingOffset
    
    var body: some View {
        if number != 0 {
            Text(number, format: .number.sign(strategy: .always()))
                .font(.largeTitle)
                .foregroundStyle(number < 0 ? .red : .green)
                .shadow(
                    color: .black,
                    radius: Constants.Shadow.radius,
                    x: Constants.Shadow.x,
                    y: Constants.Shadow.y
                )
                .offset(y: offset)
                .opacity(offset != Constants.startingOffset ? 0 : 1)
                .onAppear {
                    withAnimation(.easeIn(duration: Constants.animationDuration)) {
                        offset = number < 0 ? Constants.negativeOffset : Constants.positiveOffset
                    }
                }
                .onDisappear {
                    offset = Constants.startingOffset
                }
        }
    }
    
    struct Constants {
        static let startingOffset: CGFloat = 0
        static let positiveOffset: CGFloat = -200
        static let negativeOffset: CGFloat = 200
        static let animationDuration: TimeInterval = 1.5
        
        struct Shadow {
            static let radius: CGFloat = 1.5
            static let x: CGFloat = 1
            static let y: CGFloat = 1

            private init() {}
        }
    
        private init() {}
    }
    
    init(_ number: Int) {
        self.number = number
    }
}

#Preview {
    FlyingNumber(5)
}
