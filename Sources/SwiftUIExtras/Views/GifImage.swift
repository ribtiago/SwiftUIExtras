//
//  GifImage.swift
//  nec-os-wallet
//
//  Created by Tiago Ribeiro on 22/09/2025.
//


import SwiftUI

struct GifImage: View {
    
    @State private var image: UIImage?
    
    private var name: String
    private var isResizable: Bool = false
    
    init(_ name: String) {
        self.name = name
    }
    
    var body: some View {
        self.imageView
            .onAppear {
                let asset = NSDataAsset(name: "init_background")!
                let gifData = asset.data as CFData
                CGAnimateImageDataWithBlock(gifData, nil) { index, cgImage, stop in
                    self.image = UIImage(cgImage: cgImage)
                }
            }
    }
    
    @ViewBuilder
    private var imageView: some View {
        let image = Image(uiImage: image ?? UIImage())
        if self.isResizable {
            image.resizable()
        }
        else {
            image
        }
    }
    
    func resizable() -> some View {
        var view = self
        view.isResizable = true
        return view
    }
}
