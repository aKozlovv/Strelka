import SwiftUI

struct ContentView: View {
    var body: some View {
        StrelkaMap()
            .sheet(isPresented: .constant(true)) {
                RoutesView()
                    .presentationDetents([.height(70), .medium, .large])
                    .presentationCornerRadius(20)
                    .presentationBackground(.regularMaterial)
                    .presentationBackgroundInteraction(.enabled(upThrough: .large))
                    .interactiveDismissDisabled()
            }
    }
}

#Preview {
    ContentView()
}
