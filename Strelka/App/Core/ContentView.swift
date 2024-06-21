import SwiftUI


struct ContentView: View {
    var body: some View {
        TabView {
            MapView()
                .tag(1)
        }
        .tint(.accentColor)
        .sheet(isPresented: .constant(true)) {
            RoutesView()
                .interactiveDismissDisabled()
                .presentationDetents([.height(70), .medium, .large])
                .presentationCornerRadius(20)
                .presentationBackground(.regularMaterial)
                .presentationBackgroundInteraction(.enabled(upThrough: .large))
        }
    }
}

#Preview {
    ContentView()
}
