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
    
    @State private var showsPassword: Bool = false
    
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
            HStack {
                if self.showsPassword {
                    TextField("", text: self.$text)
                }
                else {
                    SecureField("", text: self.$text)
                }
                Button {
                    withAnimation {
                        self.showsPassword.toggle()
                    }
                } label: {
                    Image(systemName: self.showsPassword ? "eye" : "eye.slash")
                }
            }

        }
        .padding(.top, 15)
        .animation(.default, value: self.text.isEmpty)
    }
}

#if DEBUG
struct FloatingSecureField_Previews: PreviewProvider {
    
    static var previews: some View {
        FloatingSecureField("Test", text: .constant("password"))
    }
}
#endif
