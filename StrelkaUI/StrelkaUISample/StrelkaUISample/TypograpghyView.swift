import SwiftUI
import StrelkaUI

struct TypograpghyView: View {
    
    @State
    private var isShimmering: Bool = false
    
    var body: some View {
        NavigationStack {
            List {
                Section("Headline") {
                    Text("Привет, мир!")
                        .font(.title)
                        .bold()
                    
                    Text("Привет, мир!")
                        .font(.title2)
                    
                    Text("Привет, мир!")
                        .font(.headline.smallCaps())
                }
                
                Section("Subheadline") {
                    Text("Привет, мир!")
                        .font(.subheadline)
                    
                    Text("Привет, мир!")
                        .font(.subheadline.bold())
                }
                
                Section("Body") {
                    Text("Привет, мир!")
                        .font(.body)
                }
                
                Section("Capture") {
                    Text("Привет, мир!")
                        .font(.caption)
                    
                    Text("Привет, мир!")
                        .font(.caption.bold())
                }
            }
            .shimmering(if: isShimmering)
            .listStyle(.insetGrouped)
            .toolbar {
                ToolbarItemGroup {
                    Button("Старт") {
                        isShimmering = true
                    }
                    
                    Button("Стоп") {
                        isShimmering = false
                    }
                }
            }
        }
        
    }
}

#Preview {
    TypograpghyView()
}

