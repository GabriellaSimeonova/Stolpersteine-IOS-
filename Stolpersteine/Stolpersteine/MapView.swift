
import SwiftUI
import MapKit
import CoreLocation

struct MapView: View {
    let map = MKMapView()
    var coordinate: CLLocationCoordinate2D
    @StateObject var vm = ViewModel()
    @State private var region = MKCoordinateRegion()
    
    var body: some View {
       
        Map(coordinateRegion:  $region,
            annotationItems: vm.victims,
            annotationContent: { victim in
            MapMarker(coordinate: victim.locationCoordinate, tint: Color(hex: "7F462C"))
        })
        .onAppear {
            setRegion(coordinate)
            vm.fetch()
        }
    }
    
    private func setRegion(_ coordinate: CLLocationCoordinate2D) {
        region = MKCoordinateRegion(
            center: coordinate,
            span: MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2)
        )
        
//        List(victims) {victim in
//            addPin(coordinates: victim.locationCoordinate)
//        }
        
//        addPin()
    }
//    private func addPin(){
//        let coordinates = CLLocationCoordinate2D(
//            latitude: 51.4381,
//            longitude: 5.4752
//        )
//        let pin = MKPointAnnotation()
//        pin.title = "Stolpersteine here"
//        pin.coordinate = coordinates
//        map.addAnnotation(pin)
//        
//    }
    
    
}




struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView(coordinate: CLLocationCoordinate2D(latitude: 34.011_286, longitude: -116.166_868))
    }
}
