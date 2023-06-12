//
//  PlayStoryButtonView.swift
//  Stolpersteine
//
//  Created by Gabriela Simeonova on 08/06/2023.
//

import SwiftUI

struct PlayStoryButtonView: View {
    var body: some View {
        Button(action: {
            //action
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
     
 }}

struct PlayStoryButtonView_Previews: PreviewProvider {
    static var previews: some View {
        PlayStoryButtonView()
    }
}
