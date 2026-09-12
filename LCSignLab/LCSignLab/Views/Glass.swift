import SwiftUI

struct GlassCard<Content: View>: View {
    @ViewBuilder var content: () -> Content
    var body: some View {
        content()
            .padding()
            .background {
                if #available(iOS 26.0, *) {
                    Color.clear.glassEffect(.regular)
                } else {
                    RoundedRectangle(cornerRadius: 22).fill(.ultraThinMaterial)
                }
            }
            .clipShape(RoundedRectangle(cornerRadius: 22, style: .continuous))
    }
}
