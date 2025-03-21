import SwiftUI
import StrelkaUI

struct ColorsView: View {
    var body: some View {
        List {
            Section("Background") {
                Rectangle()
                    .foregroundStyle(Color.Background.primary)
                
                Rectangle()
                    .foregroundStyle(Color.Background.secondary)

            }
            
            Section("Palette") {
                
            }
            
            Section("Status") {
                
            }
            
            Section("Text") {
                
            }
        }
        .listStyle(.insetGrouped)
    }
}

#Preview {
    ColorsView()
}
