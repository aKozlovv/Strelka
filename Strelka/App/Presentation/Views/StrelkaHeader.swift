import SwiftUI

public struct StrelkaHeader: View {
    
    // MARK: Props
    
    var title: String
    var action: () -> Void
    
    // MARK: Body
    
    public var body: some View {
        HStack {
            Text(title)
                .font(.title.bold().smallCaps())
                .foregroundStyle(.secondary)
            Spacer()
            Button {
                action()
            } label: {
                Image(systemName: "plus")
                    .font(.title3)
                    .bold()
                    .foregroundStyle(.secondary)
                    .scaleEffect(1.02)
            }
        }
    }
}
