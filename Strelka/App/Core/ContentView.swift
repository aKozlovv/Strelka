import SwiftUI


struct ContentView: View {
    var body: some View {
        TabView {
            RoutesView()
                .tag(1)
                .tabItem {
                    Image(systemName: "hare")
                    Text(TabConstants.routesTab)
                }
        }
        .tint(.accentColor)
        
    }
}

#Preview {
    ContentView()
}
