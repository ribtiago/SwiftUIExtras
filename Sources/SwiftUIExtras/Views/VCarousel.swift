//
//  VCarousel.swift
//  Authenticator
//
//  Created by Tiago Ribeiro on 15/07/2022.
//

import SwiftUI

public struct VCarousel<Item, Content>: View where Content: View {
    private let items: [Item]
    private let content: (_ item: Item) -> Content
    private let offset: CGFloat
    
    @State private var focusedItem: Int = 0 {
        didSet {
            self.bindedItem = self.focusedItem
        }
    }
    @State private var oldFocusedItem: Int = 0
    @Binding private var bindedItem: Int
    
    public init(_ items: [Item], selected: Binding<Int>? = nil, offset: CGFloat = 90, @ViewBuilder content: @escaping (_ item: Item) -> Content) {
        self.items = items
        self.offset = offset / CGFloat(items.count)
        self.content = content
        if let selected = selected {
            self._bindedItem = selected
            self.focusedItem = selected.wrappedValue
            self.oldFocusedItem = selected.wrappedValue
        }
        else {
            self._bindedItem = .constant(items.count - 1)
            self.focusedItem = items.count - 1
            self.oldFocusedItem = items.count - 1
        }
    }
    
    public var body: some View {
        ZStack {
            ForEach(Array(self.items.enumerated()), id: \.0) { index, each in
                self.content(each)
                    .scaleEffect(1 - abs(self.distance(index)) * 0.1, anchor: .top)
                    .rotation3DEffect(.degrees(10 * self.distance(index)), axis: (x: 1, y: 0, z: 0), anchor: .top)
                    .opacity(1 - abs(self.distance(index)) * 0.05)
                    .offset(y: self.yOffset(index))
                    .zIndex(1 - self.distance(index))
                    .animation(.spring(response: 0.3, dampingFraction: 0.6, blendDuration: 0.15), value: self.focusedItem)
                    .onTapGesture {
                        withAnimation {
                            self.focusedItem = index
                        }
                    }
            }
        }
        .gesture(DragGesture(minimumDistance: 20, coordinateSpace: .local)
            .onEnded { value in
                withAnimation {
                    if value.translation.height > 0 {
                        self.focusedItem -= 1
                     
                        if self.focusedItem < 0 {
                            self.focusedItem = self.items.count - 1
                        }
                    }
                    else if value.translation.height < 0 {
                        self.focusedItem += 1
                     
                        if self.focusedItem >= self.items.count {
                            self.focusedItem = 0
                        }
                    }
                }
            })
    }
    
    private func distance(_ item: Int) -> Double {
        var distance = self.focusedItem - item
        if distance > self.items.count - 1 {
            distance -= self.items.count
        }
        else if distance < 0 {
            distance += self.items.count
        }
        return Double(distance)
    }
    
    private func yOffset(_ item: Int) -> Double {
        return self.offset * (Double(self.items.count) - 1 - self.distance(item))
    }
}

struct VCarousel_Previews: PreviewProvider {
    static var previews: some View {
        let items = [ "Item 1", "Item 2", "Item 3"]
        VCarousel(items) {
            Text($0)
                .frame(height: 200)
                .frame(maxWidth: .infinity)
                .background(Color.red)
                .border(Color.yellow, width: 2)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}
