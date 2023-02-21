//
//  ShimmerModifier.swift
//  
//
//  Created by Tiago Ribeiro on 21/02/2023.
//

import SwiftUI

public struct ShimmerModifier: ViewModifier {
    
    private let duration: Double
    private let bounces: Bool
    private let delay: Double
    private let minOpacity: Double
    private let startPoint: UnitPoint
    private let endPoint: UnitPoint
    
    @State private var phase: CGFloat = 0
    
    public init(duration: Double = 1.5, bounces: Bool = false, delay: Double = 0, minOpacity: Double = 0.3, startPoint: UnitPoint = .topLeading, endPoint: UnitPoint = .bottomTrailing) {
        self.duration = duration
        self.bounces = bounces
        self.delay = delay
        self.minOpacity = minOpacity
        self.startPoint = startPoint
        self.endPoint = endPoint
    }
    
    public func body(content: Content) -> some View {
        content
            .modifier(AnimatedMask(
                animatableData: self.phase,
                minOpacity: self.minOpacity,
                startPoint: self.startPoint,
                endPoint: self.endPoint)
                .animation(.linear(duration: self.duration)
                    .repeatForever(autoreverses: self.bounces)
                    .delay(self.delay)))
            .onAppear {
                self.phase = 0.8
            }
    }
    
    struct AnimatedMask: AnimatableModifier {
        
        var animatableData: CGFloat = 0
        let minOpacity: CGFloat
        let startPoint: UnitPoint
        let endPoint: UnitPoint
        
        func body(content: Content) -> some View {
            content
                .mask(LinearGradient(
                        gradient: Gradient(stops: [
                            Gradient.Stop(color: Color.black.opacity(self.minOpacity), location: self.animatableData),
                            Gradient.Stop(color: Color.black, location: self.animatableData + 0.1),
                            Gradient.Stop(color: Color.black.opacity(self.minOpacity), location: self.animatableData + 0.2),
                        ]),
                        startPoint: self.startPoint,
                        endPoint: self.endPoint)
                    .blendMode(.screen)
                    .scaleEffect(3))
        }
    }
}

public extension View {
    func shimmer(duration: Double = 1.5, bounces: Bool = false, delay: Double = 0, minOpacity: Double = 0.3, startPoint: UnitPoint = .topLeading, endPoint: UnitPoint = .bottomTrailing) -> some View {
        modifier(ShimmerModifier(
            duration: duration,
            bounces: bounces,
            delay: delay,
            minOpacity: minOpacity,
            startPoint: startPoint,
            endPoint: endPoint))
    }
}


struct ShimmerModifier_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            Text("Some long text to test")
            Text("Some long text to test")
            Text("Some long text to test")
            Text("Some long text to test")
            Text("Some long text to test")
            Text("Some long text to test")
        }
        .shimmer()
    }
}
