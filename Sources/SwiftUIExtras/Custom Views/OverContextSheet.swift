//
//  OverContextSheet.swift
//  
//
//  Created by Tiago Ribeiro on 14/06/2022.
//

import SwiftUI

public struct OverContextSheet<Label>: View where Label: View {
    
    @ViewBuilder private var label: Label
    @State private var backgroundVisible = false
    
    public init(@ViewBuilder label: () -> Label) {
        self.label = label()
    }
    
    public var body: some View {
        ZStack {
            if self.backgroundVisible {
                let background = Color.clear
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .transition(.opacity.animation(.easeInOut.delay(0.2)))
                    
                if #available(iOS 15.0, *) {
                    background.background(.ultraThinMaterial)
                }
                else {
                    background.background(VisualEffectView(effect: UIBlurEffect(style: .systemUltraThinMaterial)).ignoresSafeArea())
                }
            }
            self.label
        }
        .background(BackgroundClearView())
        .onAppear {
            self.backgroundVisible = true
        }
    }
}

#if DEBUG
struct OverContextSheet_Previews: PreviewProvider {
    static var previews: some View {
        Text("Some context")
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color.red)
            .ignoresSafeArea()
            .fullScreenCover(isPresented: .constant(true)) {
                OverContextSheet {
                    Text("test")
                        .foregroundColor(.black)
                        .padding()
                        .background(Color.white)
                        .cornerRadius(10)
                        .shadow(radius: 10)
                }
            }
    }
}
#endif
