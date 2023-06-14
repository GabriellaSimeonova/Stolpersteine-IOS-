//
//  StoneProfileView.swift
//  Stolpersteine
//
//  Created by Gabriela Simeonova on 06/06/2023.
//

import SwiftUI
import OpenAISwift

final class InfoPageViewModel: ObservableObject {
    private var client: OpenAISwift?

    init() {
        client = OpenAISwift(authToken: Secret.yourOpenAIAPIKey) //API key is protected, please use your own
    }

    func send(text: String, completion: @escaping (String) -> Void) {
        client?.sendCompletion(with: text, maxTokens: 500) { result in
            switch result {
            case .success(let model):
                let output = model.choices?.first?.text ?? ""
                completion(output)
            case .failure:
                break
            }
        }
    }
}


struct StoneProfileView: View {
    @StateObject private var viewModel = InfoPageViewModel()
    @State private var povResponse = ""
    let victim: Victim
    
    @EnvironmentObject var languageManager:LanguageManager
    
    var body: some View {
        ScrollView {
            VStack {
                ProfileCandleLightningView(victim: victim)
                HStack {
                    VStack(alignment: .leading) {
                        Text("stone-city".localized() + "\(victim.city)")
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
                
                // Story of the victim
                VStack {
                    POVView(povText: povResponse).foregroundColor(Color(hex: "7F462C"))
                }.padding()
            }
            .padding()
            .background(Color(red: 0.988, green: 0.961, blue: 0.941))
        }
        .onAppear {
            fetchPOV()
        }
        .padding()
        .background(Color(red: 0.988, green: 0.961, blue: 0.941))
    }
    
    private func fetchPOV() {
        viewModel.send(text: "Can you tell the story of \(victim.name) (Holocaust victim) in first person, lived in \(victim.city), between \(victim.dateOfBirth) and \(victim.dateOfPassing)? Make it short but touching story, 1 paragraph with most important info")
 { response in
                DispatchQueue.main.async {
                    povResponse = response
                    
                }
            }
        }
}


//viewModel.send(text: "Can you tell the story of \(victim.name) (Holocaust victim) in first person, lived in \(victim.city), between \(victim.dateOfBirth) and \(victim.dateOfPassing)?")

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

struct POVView: View {
    let povText: String

    var body: some View {
        VStack(alignment: .leading, spacing: 15) {
            HStack(spacing: 12) {
                Text("My Story:")
                    .font(.title)
                    .bold()
                    .multilineTextAlignment(.center)
            }
            HStack(spacing: 12) {
                Text(povText)
                    .frame(maxWidth: .infinity)
                    .multilineTextAlignment(.leading)
                    .padding(.bottom, 50)
            }
        }
        .padding()
        .background(Color.white)
        .cornerRadius(15)
    }
}
