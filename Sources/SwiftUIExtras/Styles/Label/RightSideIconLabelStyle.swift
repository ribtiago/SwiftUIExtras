//
//  RightSideIconLabelStyle.swift
//
//
//  Created by Tiago Ribeiro on 30/11/2021.
//

import SwiftUI

public struct RightSideIconLabelStyle: LabelStyle {
    
    public init() { }
    
    public func makeBody(configuration: Configuration) -> some View {
        HStack {
            configuration.title
            configuration.icon
        }
    }
}

public extension LabelStyle where Self == RightSideIconLabelStyle {
    static var rightSideIcon: RightSideIconLabelStyle {
        return RightSideIconLabelStyle()
    }
}

#if DEBUG
struct RightSideIconLabelStyle_Previews: PreviewProvider {
    static var previews: some View {
        Label("text", systemImage: "circle")
            .labelStyle(.rightSideIcon)
    }
}
#endif
