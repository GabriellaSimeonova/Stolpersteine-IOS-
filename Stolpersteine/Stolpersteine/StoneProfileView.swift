//
//  StoneProfileView.swift
//  Stolpersteine
//
//  Created by Gabriela Simeonova on 06/06/2023.
//

import SwiftUI

struct StoneProfileView: View {
    let victim: Victim
    
    var body: some View {
        VStack {
            ProfileCandleLightningView(victim: victim)
            HStack{
                VStack(alignment: .leading){
                    Text("City: \(victim.city)")
                        .bold()
                        .foregroundColor(Color(hex: "7F462C"))
                    Text("Address: \(victim.address)")
                        .bold()
                        .foregroundColor(Color(hex: "7F462C"))
                    
                    
                    if let dateOfBirth = victim.dateOfBirth {
                        Text("Date of Birth: \(dateOfBirth)")
                            .bold()
                            .foregroundColor(Color(hex: "7F462C"))
                    }
                    
                    if let dateOfPassing = victim.dateOfPassing {
                        Text("Date of Passing: \(dateOfPassing)")
                            .bold()
                            .foregroundColor(Color(hex: "7F462C"))
                    }
                    
                    if let placeOfPassing = victim.placeOfPassing {
                        Text("Place of Passing: \(placeOfPassing)")
                            .bold()
                            .foregroundColor(Color(hex: "7F462C"))
                    }
                    
                    if let reasonOfPassing = victim.reasonOfPassing {
                        Text("Reason of Passing: \(reasonOfPassing)")
                            .bold()
                            .foregroundColor(Color(hex: "7F462C"))
                    }
                }
                PlayStoryButtonView()
            }
        } .background(Color(red: 0.988, green: 0.961, blue: 0.941))
    }
}

//struct StoneProfileView_Previews: PreviewProvider {
//    static var previews: some View {
////        let victim = Victim(
////            name: "John Doe",
////            city: "Example City",
////            address: "Example Address",
////            dateOfBirth: "01/01/1990",
////            dateOfPassing: "01/01/2023",
////            placeOfPassing: "Example Place",
////            reasonOfPassing: "Example Reason",
////            longitude: 0.0,
////            latitude: 0.0
////        )
//
//        StoneProfileView(victim: victim)
//    }
//}
