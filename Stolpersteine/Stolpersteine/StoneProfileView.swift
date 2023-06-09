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
        ScrollView{
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
                    }.padding()
                    PlayStoryButtonView()
                }
                
                //Story of the victim
                VStack{
                    Text("As I sit here in the attic, pen in hand, I feel compelled to share the essence of my story. My name is Anne Frank, and I am a young Jewish girl living in Amsterdam during World War II. ").bold().padding(.top).foregroundColor(Color(hex: "7F462C"))
                    Text("Forced into hiding with my family, we seek solace behind the bookcase of a secret annex. Within these confined walls, I pour my heart into my diary, finding solace in its pages. Through my words, I recount the indomitable spirit that keeps us alive, the bonds formed amidst fear, and the unyielding hope for a better future. This is my tale of resilience, love, and the unwavering belief that even in the darkest of times, kindness and humanity can prevail.").foregroundColor(Color(hex: "7F462C"))
                }.padding(
                )}.padding().background(Color(red: 0.988, green: 0.961, blue: 0.941))
        }.padding().background(Color(red: 0.988, green: 0.961, blue: 0.941))
        
    }
}

struct StoneProfileView_Previews: PreviewProvider {
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
