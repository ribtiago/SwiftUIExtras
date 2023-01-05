import SwiftUI

public struct FloatingTextField: View {
    let title: String
    @Binding var text: String
    
    private var placeholderColor: Color = Color(.placeholderText)
    private var highlightedColor: Color = .accentColor
    
    public init(_ title: String, text: Binding<String>) {
        self.title = title
        self._text = text
    }

    public var body: some View {
        ZStack(alignment: .leading) {
            Text(title)
                .foregroundColor(self.text.isEmpty ? self.placeholderColor : self.highlightedColor)
                .offset(y: self.text.isEmpty ? 0 : -25)
                .scaleEffect(self.text.isEmpty ? 1 : 0.75, anchor: .leading)
            TextField("", text: self.$text)
        }
        .padding(.top, 15)
        .animation(.default, value: self.text.isEmpty)
    }
}

public extension FloatingTextField {
    
    func placeholderColor(_ color: Color) -> FloatingTextField {
        var view = self
        view.placeholderColor = color
        return view
    }
    
    func highlightedColor(_ color: Color) -> FloatingTextField {
        var view = self
        view.highlightedColor = color
        return view
    }
}

#if DEBUG
struct FloatingTextField_Previews: PreviewProvider {
    
    static var previews: some View {
        FloatingTextField("Test", text: .constant("this"))
    }
}
#endif
