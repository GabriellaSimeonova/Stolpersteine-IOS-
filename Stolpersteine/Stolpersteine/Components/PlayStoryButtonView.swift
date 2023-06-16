//
//  PlayStoryButtonView.swift
//  Stolpersteine
//
//  Created by Gabriela Simeonova on 08/06/2023.
//

import SwiftUI
import AVFoundation

struct PlayStoryButtonView: View {
    let text : String
   @State var synthesizer = AVSpeechSynthesizer()
    var body: some View {
        VStack{
        Button(action: {
            //action
            let utterance = AVSpeechUtterance(string: text)
            utterance.voice = AVSpeechSynthesisVoice(language: "en")
            utterance.rate = 0.5
            
            
            synthesizer.speak(utterance)
        }) {
            
            Image(systemName: "play.fill")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 25, height: 25)
                .foregroundColor(Color(hex: "7F462C"))
            
        }
        .padding(20)
        .background(Color(hex: "F1D0B5"))
        .clipShape(Circle())
        .frame(width: 110, height: 110)
        .shadow(radius: 3)
    }
     
 }
    
}

struct PlayStoryButtonView_Previews: PreviewProvider {
    static var previews: some View {
        PlayStoryButtonView(text: "Text")
    }
}
