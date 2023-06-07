//
//  LightTheCandleButtonView.swift
//  Stolpersteine
//
//  Created by Gabriela Simeonova on 07/06/2023.
//

import SwiftUI

struct LightTheCandleButtonView: View {
    var body: some View {
        Button(action: {
            // Button action here
        }) {
            VStack {
                Text("Light")
                    .font(.headline)
                    .foregroundColor(Color(hex: "7F462C"))
                Text("the candle")
                    .font(.headline)
                    .foregroundColor(Color(hex: "7F462C"))
                
                Image(systemName: "flame.fill")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 40, height: 40)
                    .foregroundColor(Color(hex: "7F462C"))
             
            }
            .padding()
            .background(Color(hex: "F1D0B5"))
            .clipShape(Circle())
            .shadow(radius: 3)
        }
    }
}

struct LightTheCandleButtonView_Previews: PreviewProvider {
    static var previews: some View {
        LightTheCandleButtonView()
    }
}
