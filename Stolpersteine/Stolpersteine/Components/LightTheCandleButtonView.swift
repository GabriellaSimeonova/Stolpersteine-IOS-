//
//  LightTheCandleButtonView.swift
//  Stolpersteine
//
//  Created by Gabriela Simeonova on 07/06/2023.
//

import SwiftUI


struct LightTheCandleButtonView: View {
    @Binding var isCandleLit: Bool // Use a binding for the state variable
       
       var body: some View {
           Button(action: {
               isCandleLit.toggle() 
        }) {
            VStack (spacing: 5){
                
                Image(systemName: "flame.fill")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 40, height: 40)
                    .foregroundColor(Color(hex: "7F462C"))
             
            }
            .padding()
            .background(Color(hex: "F1D0B5"))
            .clipShape(Circle())
            .frame(width: 110, height: 110)
            .shadow(radius: 3)
        }
    }
}

struct LightTheCandleButtonView_Previews: PreviewProvider {
    @State static var isCandleLit = false // Create a state variable for preview
    
    static var previews: some View {
        LightTheCandleButtonView(isCandleLit: $isCandleLit) // Provide a binding for isCandleLit
    }
}
