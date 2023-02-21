//
//  Line.swift
//  
//
//  Created by Tiago Ribeiro on 13/06/2022.
//

import SwiftUI

public struct Line: Shape {
    
    public init() { }
    
    public func path(in rect: CGRect) -> Path {
        let start = CGPoint(x: rect.minX, y: rect.midY)
        let end = CGPoint(x: rect.maxX, y: rect.midY)

        return Path { p in
            p.move(to: start)
            p.addLine(to: end)
        }
    }
}

struct Line_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            Line()
                .stroke()
            Line()
                .stroke(style: StrokeStyle(dash: [5]))
        }
        .padding()
    }
}
