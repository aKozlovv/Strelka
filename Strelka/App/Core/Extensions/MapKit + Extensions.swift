import MapKit

extension CLLocationCoordinate2D {
    static var mokLocation: CLLocationCoordinate2D {
        .init(latitude: 25.7602, longitude: -80.1959)
    }
}

extension MKCoordinateRegion {
    static var userRegion: MKCoordinateRegion {
        .init(center: .mokLocation,
              latitudinalMeters: 10000,
              longitudinalMeters: 10000)
    }
}
