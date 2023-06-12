//
//  ProfileCandleLightningView.swift
//  Stolpersteine
//
//  Created by Gabriela Simeonova on 08/06/2023.
//
import SwiftUI
struct ProfileCandleLightningView: View {
    let victim: Victim
    @State private var imageName = "CandleDark"
    @State private var isCandleLit = false // New state variable

    var body: some View {
        ZStack(alignment: .center) {
            RoundedRectangle(cornerRadius: 15) // Use RoundedRectangle instead of Image
                // Set the background color of the rectangle
                .frame(width: UIScreen.main.bounds.width * 0.9, height: 300) // Adjust the width and height of the rectangle
                .overlay(
                    Image(imageName) // Use the current value of imageName as the image name
                        .resizable()
                        .scaledToFit()
                        .clipShape(RoundedRectangle(cornerRadius: 15))
                )

            VStack(alignment: .center, spacing: 60) {
                VStack(alignment: .center, spacing: 10) {
                    Text(victim.name)
                        .padding(.bottom)
                        .foregroundColor(Color(hex: "F1D0B5"))
                        .font(.largeTitle)

                }

                if !isCandleLit {
                    LightTheCandleButtonView(isCandleLit: $isCandleLit).padding(.top)
                } else {
                    LightTheCandleButtonView(isCandleLit: $isCandleLit).opacity(0).padding(.top)
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




struct ProfileCandleLightningView_Previews: PreviewProvider {
    static var previews: some View {
        let victim = Victim(
            id: 1,
            name: "John Doe",
            city: "Example City",
            address: "Example Address",
            dateOfBirth: "01/01/1990",
            dateOfPassing: "01/01/2023",
            placeOfPassing: "Example Place",
            reasonOfPassing: "Example Reason",
            location: Victim.Coordinates(lat: 0, long: 0)
        )
        
        return StoneProfileView(victim: victim)
    }
}
