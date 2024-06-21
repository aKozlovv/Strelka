import SwiftUI


struct ContentView: View {
    var body: some View {
        TabView {
            MapView()
                .tag(1)
                .tabItem {
                    Image(systemName: Tab.routes.symbol)
                    Text(Tab.routes.rawValue)
                }
                .sheet(isPresented: .constant(true)) {
                    RoutesView()
                        .interactiveDismissDisabled()
                        .presentationDetents([.height(70), .medium, .large])
                        .presentationCornerRadius(20)
                        .presentationBackground(.regularMaterial)
                        .presentationBackgroundInteraction(.enabled(upThrough: .large))
                }
        }
        .tint(.accentColor)
    }
}

#Preview {
    ContentView()
}
