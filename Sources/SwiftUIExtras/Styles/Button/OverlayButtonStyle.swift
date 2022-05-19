//
//  OverlayButtonStyle.swift
//  
//
//  Created by Tiago Ribeiro on 20/01/2022.
//

import SwiftUI

public struct OverlayButtonStyle: ButtonStyle {
    
    public init() { }
    
    public func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .foregroundColor(configuration.isPressed ? .black : .white)
            .padding()
            .background(configuration.isPressed ?
                        VisualEffectView(effect: UIBlurEffect(style: .systemChromeMaterialLight)) :
                        VisualEffectView(effect: UIBlurEffect(style: .systemChromeMaterialDark)))
            .clipShape(Circle())
    }
}

public extension ButtonStyle where Self == OverlayButtonStyle {
    static var overlay: OverlayButtonStyle {
        return OverlayButtonStyle()
    }
}

#if DEBUG
struct OverlayButtonStyle_Previews: PreviewProvider {
    static var previews: some View {
        Button(action: { }) {
            Image(systemName: "camera.rotate.fill")
        }
        .buttonStyle(.overlay)
    }
}
#endif
