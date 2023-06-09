//
//  ContentView.swift
//  Stolpersteine
//
//  Created by Radolina on 06/06/2023.
//

import SwiftUI
import CoreLocation


struct ContentView: View {
    
   

       struct Coordinates: Hashable, Codable {
           var lat: Double
           var long: Double
       }
    
    
       var locationCoordinate: CLLocationCoordinate2D {
           CLLocationCoordinate2D(
               latitude: 51.4381,
               longitude: 5.4752)
       }
   
    var body: some View {
        TabView{
            HomeView()
                .tabItem(){
                Image(systemName: "house")
                Text("Home")
            }
            MapView(coordinate: locationCoordinate)
                .tabItem(){
                Image(systemName: "map")
                Text("Map")
            }
            FaqView()
                .tabItem(){
                Image(systemName: "questionmark.bubble")
                Text("FAQ")
            }
            UserProfileView()
                .tabItem(){
                Image(systemName: "person")
                Text("Profile")
            }
        }.accentColor(Color(hex: "7F462C"))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
