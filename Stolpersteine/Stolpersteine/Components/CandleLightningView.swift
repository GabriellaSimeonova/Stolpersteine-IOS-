//
//  CandleLightningView.swift
//  Stolpersteine
//
//  Created by Gabriela Simeonova on 07/06/2023.
//

import SwiftUI

struct CandleLightningView: View {
    @State private var imageName = "CandleDark"
    @State private var isCandleLit = false // New state variable

    var body: some View {
        ZStack {
            Image(imageName) // Use the dynamic image name
                .resizable()
                .scaledToFill()
                .clipShape(RoundedRectangle(cornerRadius: 15))
                .frame(width: UIScreen.main.bounds.width * 0.9, height: 200)

            VStack {
                Text("Name").padding().foregroundColor(.red)

                if !isCandleLit {
                    LightTheCandleButtonView(isCandleLit: $isCandleLit) // Pass the binding to the button
                }
            }
        }
        .onChange(of: isCandleLit) { newValue in
            imageName = newValue ? "CandleLit" : "CandleDark" // Update image name when isCandleLit changes
        }
    }
}



struct CandleLightningView_Previews: PreviewProvider {
    static var previews: some View {
        CandleLightningView()
    }
}
