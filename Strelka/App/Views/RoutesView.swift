import SwiftUI

struct RoutesView: View {
    var body: some View {
        ScrollView(showsIndicators: false) {
            HStack {
                Text("Your routes")
                    .font(.title.bold().smallCaps())
                    .foregroundStyle(.secondary)
                
                Spacer()
                
                Button {
                    
                } label: {
                    Image(systemName: "plus")
                        .bold()
                }
            }
            .padding(.all, 25)
        }
    }
}
