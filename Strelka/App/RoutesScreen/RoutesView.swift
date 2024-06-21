import SwiftUI
import MapKit

struct RoutesView: View {
    
    @State
    private var markItems = [MKMapItem]()
    
    @State
    private var cameraPosition: MapCameraPosition = .region(.userRegion)
    
    var body: some View {
        Map(position: $cameraPosition) {
            Marker("Mok", coordinate: .mokLocation)
                .tint(.accent)
        }
        .sheet(isPresented: .constant(true)) {
            ScrollView(showsIndicators: false) {
                HStack {
                    Text("Your routes")
                        .font(.title.bold().smallCaps())
                        .foregroundStyle(.secondary)
                    Spacer()
                    Button {} label: {
                        Image(systemName: "plus")
                            .bold()
                    }
                }
                .padding(.all, 25)
            }
            .presentationDetents([.height(70), .medium, .large])
            .presentationCornerRadius(20)
            .presentationBackground(.regularMaterial)
            .presentationBackgroundInteraction(.enabled(upThrough: .large))
        }
    }
}

#Preview {
    RoutesView()
}
