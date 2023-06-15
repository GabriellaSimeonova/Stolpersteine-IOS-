
import SwiftUI
import MapKit
import CoreLocation

struct MapView: View {
   
    @StateObject var vm = ViewModel()
    @State private var region = MKCoordinateRegion(
        center:
            CLLocationCoordinate2D(
                latitude: 51.4381,
                longitude: 5.4752)
        ,
        span: MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2)
    )
    @State private var searchText = ""
    
    
    var body: some View {
       
        VStack{
            SearchBar(text: $searchText)
                              .padding(.top, 16)
            Map(coordinateRegion:  $region,
                annotationItems: vm.victims,
                annotationContent: { victim in
                MapMarker(coordinate: victim.locationCoordinate, tint: Color(hex: "7F462C"))
            })
            .onAppear {
                
                     vm.fetch()
                
            }
        }
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

struct SearchBar: View {
        @Binding var text: String
        @State private var showFilteringOptions = false
        @State private var selectedOption = 0 // This will hold the index of the selected filtering option
        
        var body: some View {
            HStack {
                TextField("Search", text: $text)
                    .padding(EdgeInsets(top: 8, leading: 8, bottom: 8, trailing: 0))
                    .background(Color(.systemGray6))
                    .cornerRadius(8)
                
                Button(action: {
                    self.showFilteringOptions = true
                }) {
                    Image(systemName: "line.horizontal.3.decrease.circle")
                        .foregroundColor(.gray)
                        .padding(8)
                }
                .actionSheet(isPresented: $showFilteringOptions) {
                    ActionSheet(title: Text("Sort by"), buttons: [
                        .default(Text("Distance: Closest to Futhest"), action: {
                            self.selectedOption = 1
                        }),
                        .default(Text("Top rated"), action: {
                            self.selectedOption = 2
                            
                        }),
                        .default(Text("Most recent"), action: {
                            self.selectedOption = 3
                            
                        }),
                        .cancel()
                    ])
                }
            }
            .padding(.horizontal)
        }
    }
    




struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}
