import SwiftUI

struct ContentView: View {
    var body: some View {
        StrelkaMap()
            .sheet(isPresented: .constant(true)) {
                RoutesView()
                    .strelkaSheetStyle()
            }
    }
}



#Preview {
    ContentView()
}
