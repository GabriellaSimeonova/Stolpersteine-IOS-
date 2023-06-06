//
//  ContentView.swift
//  Stolpersteine
//
//  Created by Radolina on 06/06/2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView{
            HomeView()
                .tabItem(){
                Image(systemName: "house")
                Text("Home")
            }
            MapView()
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
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
