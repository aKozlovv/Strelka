import SwiftUI
import MapKit

public struct StrelkaMap: View {
    
    @State
    private var markItems = [MKMapItem]()
    
    @State
    private var cameraPosition: MapCameraPosition = .region(.userRegion)
    
    public var body: some View {
        Map(position: $cameraPosition) {
            Marker("Mok", coordinate: .mokLocation)
                .tint(.accent)
        }
        .mapControls {
            MapCompass()
            MapUserLocationButton()
            MapPitchToggle()
        }
        .mapStyle(.standard(elevation: .realistic))
        
    }
}

#Preview {
    StrelkaMap()
}

