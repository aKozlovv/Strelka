import SwiftUI
import MapKit

struct MapView: View {
    
    @State
    private var markItems = [MKMapItem]()
    
    @State
    private var cameraPosition: MapCameraPosition = .region(.userRegion)
    
    var body: some View {
        Map(position: $cameraPosition) {
            Marker("Mok", coordinate: .mokLocation)
                .tint(.accent)
        }
    }
}

#Preview {
    MapView()
}

