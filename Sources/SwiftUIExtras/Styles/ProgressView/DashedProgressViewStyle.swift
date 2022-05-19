import SwiftUI

public struct DashedProgressViewStyle: ProgressViewStyle {
    
    public init() { }
    
    public func makeBody(configuration: Configuration) -> some View {
        ZStack {
            configuration.label
            Circle()
                .strokeBorder(style: StrokeStyle(
                    lineWidth: 2,
                    lineCap: .round,
                    lineJoin: .round,
                    dash: [0.4, 15]))
                .foregroundColor(.white)
            
            Circle()
                .trim(from: 0, to: max(configuration.fractionCompleted ?? 0, 0.001))
                .stroke(Color.accentColor, style: StrokeStyle(
                    lineWidth: 4,
                    lineCap: .round))
                .rotationEffect(.degrees(-90))
        }
    }
}

public extension ProgressViewStyle where Self == DashedProgressViewStyle {
    static var dashed: DashedProgressViewStyle {
        return DashedProgressViewStyle()
    }
}

#if DEBUG
struct DashedProgressViewStyle_Previews: PreviewProvider {
    static var previews: some View {
        ProgressView(value: 0.2)
            .frame(width: 100, height: 100)
            .progressViewStyle(.dashed)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color.black)
    }
}
#endif
