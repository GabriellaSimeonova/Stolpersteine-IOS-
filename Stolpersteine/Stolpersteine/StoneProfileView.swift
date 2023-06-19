//
//  StoneProfileView.swift
//  Stolpersteine
//
//  Created by Gabriela Simeonova on 06/06/2023.
//

import SwiftUI
import OpenAISwift
import AVFoundation

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
    @State private var isLoading = true // Add isLoading state variable here
    let victim: Victim
    
    @EnvironmentObject var languageManager: LanguageManager
    
    var body: some View {
        ScrollView {
            VStack {
                ProfileCandleLightningView(victim: victim)
                HStack {
                    VStack(alignment: .leading) {
                        Text("stone-city".localized() + "\(victim.city)")
                            .bold()
                            .foregroundColor(Color(hex: "7F462C"))
                        Text("Address: ".localized() + "\(victim.address)")
                            .bold()
                            .foregroundColor(Color(hex: "7F462C"))
                        
                        if let dateOfBirth = victim.dateOfBirth {
                            Text("Date of Birth: ".localized() + "\(victim.dateOfBirth)")
                                .bold()
                                .foregroundColor(Color(hex: "7F462C"))
                        }
                        
                        if let dateOfPassing = victim.dateOfPassing {
                            Text("Date of Passing: ".localized() + "\(victim.dateOfPassing)")
                                .bold()
                                .foregroundColor(Color(hex: "7F462C"))
                        }
                        
                        if let placeOfPassing = victim.placeOfPassing {
                            Text("Place of Passing: ".localized() + "\(victim.placeOfPassing)")
                                .bold()
                                .foregroundColor(Color(hex: "7F462C"))
                        }
                        
                        if let reasonOfPassing = victim.reasonOfPassing {
                            Text("Reason of Passing: ".localized() + "\(victim.reasonOfPassing)")
                                .bold()
                                .foregroundColor(Color(hex: "7F462C"))
                        }
                    }.padding()
                    PlayStoryButtonView(text: povResponse)
                }
                
                // Story of the victim
                VStack {
                    POVView(povText: povResponse, isLoading: $isLoading) // Pass isLoading as a binding
                        .foregroundColor(Color(hex: "7F462C"))
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
        isLoading = true
        
        viewModel.send(text: "Can you tell the story of \(victim.name) (Holocaust victim) in first person, lived in \(victim.city), between \(victim.dateOfBirth) and \(victim.dateOfPassing)? Make it short but touching story, 1 paragraph with most important info") { response in
            DispatchQueue.main.async {
                povResponse = response
                isLoading = false
            }
        }
    }
}

struct POVView: View {
    let povText: String
    @Binding var isLoading: Bool // Use isLoading as a binding

    var body: some View {
        VStack(alignment: .leading, spacing: 15) {
            HStack(spacing: 12) {
                Text("My Story:")
                    .font(.title)
                    .bold()
                    .multilineTextAlignment(.center)
            }
            HStack(spacing: 12) {
                if isLoading {
                    LoaderView()
                } else {
                    Text(povText)
                        .frame(maxWidth: .infinity)
                        .multilineTextAlignment(.leading)
                        .padding(.bottom, 50)
                }
            }
        }
        .padding()
        .background(Color.white)
        .cornerRadius(15)
    }
}

struct LoaderView: View {
    @State private var isAnimating = false
    
    var body: some View {
        VStack {
            Image("text")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 50, height: 50)
                .scaleEffect(isAnimating ? 1.2 : 1.0) // Apply scale animation
                .animation(Animation.easeInOut(duration: 0.5).repeatForever(autoreverses: true)) // Animate scale
                .onAppear {
                    isAnimating = true
                }
                .onDisappear {
                    isAnimating = false
                }
        }
    }
}

