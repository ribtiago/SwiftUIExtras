//
//  BackgroundClearView.swift
//  
//
//  Created by Tiago Ribeiro on 30/11/2021.
//

import SwiftUI

public struct BackgroundClearView: UIViewRepresentable {
    
    public init() { }
    
    public func makeUIView(context: Context) -> UIView {
        let view = UIView()
        DispatchQueue.main.async {
            view.superview?.superview?.backgroundColor = .clear
        }
        return view
    }

    public func updateUIView(_ uiView: UIView, context: Context) { }
}
