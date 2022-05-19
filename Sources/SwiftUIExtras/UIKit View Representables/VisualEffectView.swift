import SwiftUI

public struct VisualEffectView: UIViewRepresentable {
    private let effect: UIVisualEffect
    
    public init(effect: UIVisualEffect) {
        self.effect = effect
    }
    
    public func makeUIView(context: UIViewRepresentableContext<Self>) -> UIVisualEffectView {
        return UIVisualEffectView()
    }
    
    public func updateUIView(_ uiView: UIVisualEffectView, context: UIViewRepresentableContext<Self>) {
        uiView.effect = self.effect
    }
}
