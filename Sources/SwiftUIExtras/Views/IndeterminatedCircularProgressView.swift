//
//  IndeterminatedCircularProgressView.swift
//  SwiftUIExtras
//
//  Created by Tiago Ribeiro on 29/01/2026.
//

import SwiftUI
import Combine

@available(iOS 15.0, *)
struct IndeterminatedCircularProgressView: View {
    
    private struct Style: ProgressViewStyle {
        
        public init() { }
        
        public func makeBody(configuration: Configuration) -> some View {
            let fraction = configuration.fractionCompleted ?? 1
            Circle()
                .stroke(.tint.opacity(0.3), lineWidth: 10)
                .overlay {
                    Circle()
                        .trim(from: 0, to: fraction / 1.2 * (fraction < 0.5 ? fraction : 1 - fraction))
                        .stroke(.tint, style: StrokeStyle(
                            lineWidth: 10,
                            lineCap: .round))
                        .rotationEffect(.degrees(-90 + 360 * fraction))
                        
                }
        }
    }

    
    @State private var progress: Double = 0
    @State private var timerCancellable: AnyCancellable?
    
    var body: some View {
        ProgressView(value: self.progress)
            .progressViewStyle(IndeterminatedCircularProgressView.Style())
            .onAppear {
                self.timerCancellable = Timer.publish(every: 0.007, on: .main, in: .common)
                    .autoconnect()
                    .sink { _ in
                        self.progress += 0.005
                        if self.progress >= 1 {
                            self.progress = 0
                        }
                    }
            }
    }
}

#if DEBUG
@available(iOS 15.0, *)
struct IndeterminatedCircularProgressView_Previews: PreviewProvider {
    static var previews: some View {
        IndeterminatedCircularProgressView()
            .frame(width: 100, height: 100)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color.black)
    }
}
#endif
