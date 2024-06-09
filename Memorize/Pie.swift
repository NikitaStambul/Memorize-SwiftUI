//
//  Pie.swift
//  Memorize
//
//  Created by Nikita Stambul on 6/8/24.
//

import SwiftUI
import CoreGraphics

struct Pie: Shape {
    var startAngle = Angle.zero
    let endAngle: Angle
    let clockwise = true
    
    func path(in rect: CGRect) -> Path {
        let startAngle = startAngle - .degrees(90)
        let endAngle = endAngle - .degrees(90)

        let center = CGPoint(x: rect.midX, y: rect.midY)
        let radius = min(rect.width, rect.height) / 2
        let start = CGPoint(
            x: center.x + radius * cos(startAngle.radians),
            y: center.y + radius * sin(startAngle.radians)
        )
        
        print(start)

        var p = Path()

        p.move(to: center)
        p.addLine(to: start)
        p.addArc(
            center: center,
            radius: radius,
            startAngle: startAngle,
            endAngle: endAngle,
            clockwise: !clockwise
        )
        p.addLine(to: center)
        
        return p
    }
}

#Preview {
    Pie(startAngle: .degrees(30), endAngle: .degrees(80))
        .stroke(.orange)
}
