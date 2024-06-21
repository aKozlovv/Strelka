import SwiftUI

struct StrelkaSheet: ViewModifier {
    func body(content: Content) -> some View {
        content
            .presentationDetents([.height(70), .medium, .large])
            .presentationCornerRadius(20)
            .presentationBackground(.regularMaterial)
            .presentationBackgroundInteraction(.enabled(upThrough: .large))
            .interactiveDismissDisabled()
    }
}

extension View {
    func strelkaSheetStyle() -> some View {
        modifier(StrelkaSheet())
    }
}
