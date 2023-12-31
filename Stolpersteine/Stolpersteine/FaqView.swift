//
//  FaqView.swift
//  Stolpersteine
//
//  Created by Gabriela Simeonova on 06/06/2023.
//


import SwiftUI

struct FAQItem: Identifiable {
    let id = UUID()
    var question: String
    var answer: String
    var isOpen: Bool = false
}

struct FAQView: View {
    
    @EnvironmentObject var languageManager:LanguageManager
    
    @State private var faqItems: [FAQItem] = [
        FAQItem(question: "faq.question1".localized(), answer: "faq.answer1".localized()),
        FAQItem(question: "faq.question2".localized(), answer: "faq.answer2".localized()),
        FAQItem(question: "faq.question3".localized(), answer: "faq.answer3".localized()),
        FAQItem(question: "faq.question4".localized(), answer: "faq.answer4".localized()),
    ]

    var body: some View {
        
        VStack {
            Text("faq.heading".localized())
                .font(.headline)
                .fontWeight(.bold)
                .multilineTextAlignment(.center)
                .padding()

            List {
                ForEach(faqItems) { item in
                    DisclosureGroup(
                        content: {
                            Text(item.answer.localized())
                                .font(.body)
                                .foregroundColor(.secondary)
                                .padding(.vertical, 8)
                                .padding(.horizontal, 16)

                        },
                        label: {
                            HStack {
                                Text(item.question.localized())
                                    .font(.headline)
                                    .padding(.vertical, 8)
                                    .padding(.leading, 16)

                                Spacer()
                            }
                        }
                    )
                    .accentColor(.black)
                    .animation(.easeInOut)
                }
            } .background(Color(red:0.988, green: 0.961, blue: 0.941))    

                .scrollContentBackground(.hidden)
            .listStyle(.insetGrouped)
            
            
        }
        .foregroundColor(Color(hex: "7F462C")) // Set the font color
        .background(Color(red:0.988, green: 0.961, blue: 0.941))    }
}

extension Color {
    init(hex: String) {
        var hexString = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var intColor: UInt64 = 0
        Scanner(string: hexString).scanHexInt64(&intColor)

        let red = Double((intColor & 0xff0000) >> 16) / 255.0
        let green = Double((intColor & 0xff00) >> 8) / 255.0
        let blue = Double(intColor & 0xff) / 255.0

        self.init(red: red, green: green, blue: blue)
    }
}

struct FaqView: View {
    var body: some View {
        NavigationView {
            FAQView()

        }
    }
}

struct FaqView_Previews: PreviewProvider {
    static var previews: some View {
        FaqView()
    }
        
}






