//
//  CandleLightningView.swift
//  Stolpersteine
//
//  Created by Gabriela Simeonova on 07/06/2023.
//

import SwiftUI

struct CandleLightningView: View {
    var body: some View {
        ZStack {
            
            Image("CandleDark")
                .resizable()
                .scaledToFill()
                .clipShape(RoundedRectangle(cornerRadius: 15))
                .frame(width: UIScreen.main.bounds.width * 0.9, height: 200)
        }
    }
}

struct CandleLightningView_Previews: PreviewProvider {
    static var previews: some View {
        CandleLightningView()
    }
}
