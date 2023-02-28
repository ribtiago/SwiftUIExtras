//
//  FloatingSecureField.swift
//  
//
//  Created by Tiago Ribeiro on 02/02/2022.
//

import SwiftUI

public struct FloatingSecureField: View {
    let title: String
    @Binding var text: String
    let canViewPassword: Bool
    
    @State private var showsPassword: Bool = false
    
    private var placeholderColor: Color = Color(.placeholderText)
    private var highlightedColor: Color = .accentColor
    
    public init(_ title: String, text: Binding<String>, canViewPassword: Bool = true) {
        self.title = title
        self._text = text
        self.canViewPassword = canViewPassword
    }

    public var body: some View {
        ZStack(alignment: .leading) {
            Text(title)
                .foregroundColor(self.text.isEmpty ? self.placeholderColor : self.highlightedColor)
                .offset(y: self.text.isEmpty ? 0 : -25)
                .scaleEffect(self.text.isEmpty ? 1 : 0.75, anchor: .leading)
            HStack {
                if self.showsPassword && self.canViewPassword {
                    TextField("", text: self.$text)
                }
                else {
                    SecureField("", text: self.$text)
                }
                if self.canViewPassword {
                    Button {
                        withAnimation {
                            self.showsPassword.toggle()
                        }
                    } label: {
                        Image(systemName: self.showsPassword ? "eye" : "eye.slash")
                    }
                }
            }

        }
        .padding(.top, 15)
        .animation(.default, value: self.text.isEmpty)
    }
}

public extension FloatingSecureField {
    
    func placeholderColor(_ color: Color) -> FloatingSecureField {
        var view = self
        view.placeholderColor = color
        return view
    }
    
    func highlightedColor(_ color: Color) -> FloatingSecureField {
        var view = self
        view.highlightedColor = color
        return view
    }
}

#if DEBUG
struct FloatingSecureField_Previews: PreviewProvider {
    
    static var previews: some View {
        FloatingSecureField("Test", text: .constant("password"), canViewPassword: false)
    }
}
#endif
