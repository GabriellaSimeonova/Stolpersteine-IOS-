//
//  ContentView.swift
//  Stolpersteine
//
//  Created by Radolina on 06/06/2023.
//

import SwiftUI
import CoreLocation


struct ContentView: View {
    
    @EnvironmentObject var languageManager:LanguageManager

       struct Coordinates: Hashable, Codable {
           var lat: Double
           var long: Double
       }
    
    
       
   
    var body: some View {
        TabView{
            HomeView()
                .tabItem(){
                Image(systemName: "house")
                    Text("Home".localized())
            }
            MapView()
                .tabItem(){
                Image(systemName: "map")
                    Text("Map".localized())
            }
            FaqView()
                .tabItem(){
                Image(systemName: "questionmark.bubble")
                    Text("FAQ".localized())
            }
            UserProfileView()
                .tabItem(){
                Image(systemName: "person")
                    Text("Profile".localized())
            }
        }.accentColor(Color(hex: "7F462C"))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
