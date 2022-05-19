import SwiftUI

public struct FloatingTextField: View {
    let title: String
    @Binding var text: String
    
    public init(_ title: String, text: Binding<String>) {
        self.title = title
        self._text = text
    }

    public var body: some View {
        ZStack(alignment: .leading) {
            Text(title)
                .foregroundColor(self.text.isEmpty ? Color(.placeholderText) : .accentColor)
                .offset(y: self.text.isEmpty ? 0 : -25)
                .scaleEffect(self.text.isEmpty ? 1 : 0.75, anchor: .leading)
            TextField("", text: self.$text)
        }
        .padding(.top, 15)
        .animation(.default, value: self.text.isEmpty)
    }
}

#if DEBUG
struct FloatingTextField_Previews: PreviewProvider {
    
    static var previews: some View {
        FloatingTextField("Test", text: .constant("this"))
    }
}
#endif
