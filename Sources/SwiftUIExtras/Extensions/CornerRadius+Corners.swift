//
//  CornerRadius+Corners.swift
//  MobileWAY
//
//  Created by Tiago Ribeiro on 04/10/2021.
//

import SwiftUI


public extension View {
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        self.clipShape(RoundedCorner(radius: radius, corners: corners))
    }
}

struct RoundedCorner: Shape {
    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners

    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(
            roundedRect: rect,
            byRoundingCorners: self.corners,
            cornerRadii: CGSize(width: self.radius, height: self.radius))
        return Path(path.cgPath)
    }
}
