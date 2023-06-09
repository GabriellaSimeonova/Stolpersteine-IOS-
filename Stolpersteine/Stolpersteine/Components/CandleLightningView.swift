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
        ZStack(alignment: .trailing) {
            RoundedRectangle(cornerRadius: 15) // Use RoundedRectangle instead of Image
                // Set the background color of the rectangle
                .frame(width: UIScreen.main.bounds.width * 0.9, height: 300) // Adjust the width and height of the rectangle
                .overlay(
                    Image(imageName) // Use the current value of imageName as the image name
                        .resizable()
                        .scaledToFit()
                        .clipShape(RoundedRectangle(cornerRadius: 15))
                )

            VStack {
                VStack(alignment: .trailing) {
                    Text("Annelies Marie Frank")
                        .padding()
                        .foregroundColor(Color(hex: "F1D0B5"))
                        .padding(.top)
                        .font(.title)
                    Text("Date of birth: 12-06-1929")
                        .foregroundColor(Color(hex: "F1D0B5"))
                    Text("Date of passing: 31-03-1945")
                        .foregroundColor(Color(hex: "F1D0B5"))
                    Text("Place of death: Bergen-Belsen")
                        .foregroundColor(Color(hex: "F1D0B5"))
                    Text("Cause of prosecution: Jewish")
                        .foregroundColor(Color(hex: "F1D0B5"))
                }

                if !isCandleLit {
                    LightTheCandleButtonView(isCandleLit: $isCandleLit)
                } else {
                    LightTheCandleButtonView(isCandleLit: $isCandleLit).opacity(0)
                }
            }
            .padding() // Add padding inside the rectangle
        }
        .padding([.leading, .trailing], 20) // Add padding to the left and right sides of the screen
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
