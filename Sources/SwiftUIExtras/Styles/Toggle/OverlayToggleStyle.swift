import SwiftUI

public struct OverlayToggleStyle: ToggleStyle {
    
    public init() { }
    
    public func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .foregroundColor(configuration.isOn ? .black : .white)
            .padding()
            .background(configuration.isOn ?
                        VisualEffectView(effect: UIBlurEffect(style: .systemChromeMaterialLight)) :
                        VisualEffectView(effect: UIBlurEffect(style: .systemChromeMaterialDark)))
            .clipShape(Circle())
            .onTapGesture { configuration.isOn.toggle() }
    }
}

public extension ToggleStyle where Self == OverlayToggleStyle {
    static var overlay: OverlayToggleStyle {
        return OverlayToggleStyle()
    }
}

#if DEBUG
struct OverlayToggleStyle_Previews: PreviewProvider {
    
    static var previews: some View {
        VStack {
            Toggle("Test", isOn: .constant(false))
                .toggleStyle(.overlay)
            Toggle("Test", isOn: .constant(true))
                .toggleStyle(.overlay)
        }
    }
}
#endif
