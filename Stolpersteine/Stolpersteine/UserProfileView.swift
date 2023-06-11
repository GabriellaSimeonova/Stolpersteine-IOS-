//
//  UserProfileView.swift
//  Stolpersteine
//
//  Created by Gabriela Simeonova on 06/06/2023.
//

import SwiftUI

struct UserProfileView: View {
    @State private var isSheetPresented = false
    
    let darkBrown = Color(hex: "7F462C")
    
    var body: some View {
        VStack(spacing: 20) {
            ZStack(alignment: .topTrailing) {
                Circle()
                    .foregroundColor(Color.red)
                    .frame(width: 50, height: 50)
                    .offset(x: 80, y: -30)
                
                Text("Your Profile")
                    .font(.title2)
                    .bold()
                    .padding()
            
    }
    
            CircleView(title: "Stones Visited", number: "1", color: darkBrown)
                            .onTapGesture {
                                isSheetPresented = true
                            }
                            .sheet(isPresented: $isSheetPresented) {
                                Text("Stones Visited Sheet")
                            }
            CircleView(title: "Candles Lit", number: "3", color: Color.blue)
                            .onTapGesture {
                                isSheetPresented = true
                            }
                            .sheet(isPresented: $isSheetPresented) {
                                Text("Stones Visited Sheet")
                            }
                        
            CircleView(title: "Stones Saved", number: "0", color: Color.purple)
                            .onTapGesture {
                                isSheetPresented = true
                            }
                            .sheet(isPresented: $isSheetPresented) {
                                Text("Candles Lit Sheet")
                            }
        }.padding(.top, -90)
               .padding()
           }
       }
            
struct CircleView: View {
    var title: String
    var number: String
    var color: Color
    
    var body: some View {
        VStack {
            ZStack {
                Circle()
                    .foregroundColor(color)
                    .frame(width: 120, height: 120)
                    
                Text(number)
                    .font(.system(size: 40))
                    .foregroundColor(.white)
            }
            Text(title)
                .font(.system(size: 20))
        }
    }
}
    
    struct UserProfileView_Previews: PreviewProvider {
        static var previews: some View {
            UserProfileView()
        }
    }

