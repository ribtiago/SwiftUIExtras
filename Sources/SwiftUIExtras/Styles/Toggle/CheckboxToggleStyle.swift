import SwiftUI

public struct CheckboxToggleStyle: ToggleStyle {
    
    public init() { }
    
    public func makeBody(configuration: Configuration) -> some View {
        HStack(alignment: .top) {
            Image(systemName: configuration.isOn ? "checkmark.square.fill" : "square")
                .resizable()
                .frame(width: 22, height: 22)
                .foregroundColor(.accentColor)
            configuration.label
            Spacer()
        }
        .onTapGesture { configuration.isOn.toggle() }
    }
}

#if DEBUG
struct CheckboxToggleStyle_Previews: PreviewProvider {
    
    static var previews: some View {
        VStack {
            Toggle("Test", isOn: .constant(false))
                .toggleStyle(CheckboxToggleStyle())
            Toggle("Test", isOn: .constant(true))
                .toggleStyle(CheckboxToggleStyle())
        }
    }
}
#endif
