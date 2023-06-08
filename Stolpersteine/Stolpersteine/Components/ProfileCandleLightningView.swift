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
            Image(imageName) // Use the dynamic image name
                .resizable()
                .scaledToFill()
                .clipShape(RoundedRectangle(cornerRadius: 15))
                .frame(width: UIScreen.main.bounds.width * 0.9, height: 290)
            VStack{
                VStack(alignment: .center){
                    Text(victim.name).foregroundColor(Color(hex: "F1D0B5")).padding(.bottom).font(.title)
                }
               

                if !isCandleLit {
                    LightTheCandleButtonView(isCandleLit: $isCandleLit)
                }else
                {
                    LightTheCandleButtonView(isCandleLit: $isCandleLit).opacity(0)
                }
            }
        }
        .onChange(of: isCandleLit) { newValue in
            imageName = newValue ? "CandleLit" : "CandleDark" // Update image name when isCandleLit changes
        }
    }
}



struct ProfileCandleLightningView_Previews: PreviewProvider {
    static var previews: some View {
        let victim = Victim(
            name: "John Doe",
            city: "Example City",
            address: "Example Address",
            dateOfBirth: "01/01/1990",
            dateOfPassing: "01/01/2023",
            placeOfPassing: "Example Place",
            reasonOfPassing: "Example Reason"
        )
        ProfileCandleLightningView(victim: victim)
    }
}
