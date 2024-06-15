//
//  FlyingNumber.swift
//  Memorize
//
//  Created by Nikita Stambul on 6/13/24.
//

import SwiftUI

struct FlyingNumber: View {
    let number: Int
    
    var body: some View {
        if number != 0 {
            Text(number, format: .number)
        }
    }
    
    init(_ number: Int) {
        self.number = number
    }
}

#Preview {
    FlyingNumber(5)
}
