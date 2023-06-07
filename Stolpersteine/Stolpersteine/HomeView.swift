//
//  HomeView.swift
//  Stolpersteine
//
//  Created by Gabriela Simeonova on 06/06/2023.
//

import SwiftUI

struct Victim: Hashable,  Codable{
    let name: String
    let city: String
//    let officialStone: Bool
//    let address: String
//    let name: String
//    let dateOfBirth: String
//    let dateOfPassing: String
//    let placeOfPassing: String
//    let reasonOfPassing: String
//    let gender: String
//    let photo: String
//    let url: String
//    let niodUrl: String
//    let mapUrl: String
}

class ViewModel: ObservableObject{
    @Published var victims: [Victim] = []
    
    func fetch(){
        
        guard let url = URL(string: "https://api.struikelstenengids.nl/v2/export/stones?secret=yONOtKGoGO9u9O8pC247jKl9NcDxEl54C2b8N06nzgF9WR6S1I&fbclid=IwAR2JETryTuv4SY-SBm6PoPOrSkhbPWJ2tUDl724lFkqn25jFYz82Oc5Pk1c")else {
            return
            
        }
            
            let task = URLSession.shared.dataTask(with: url) {[weak self] data, _,
                error in
                guard let data = data, error == nil else{
                    return
                }
                
                //convert data
                
                do{
                    let victims = try
                    JSONDecoder().decode([Victim].self, from: data)
                    DispatchQueue.main.async {
                        self?.victims = victims
                    }
                }
                catch{
                    print(error)
                }
            }
        task.resume()
    }
}


struct HomeView: View {
    @StateObject var viewModel = ViewModel()
    var body: some View {
        NavigationView{
            List{
                ForEach(viewModel.victims, id: \.self){ victim in
                    
                    HStack{
                        Image("")
                            .frame(width: 130, height: 70)
                            .background(Color.gray)
                        Text(victim.name)
                            .bold()
                    }
                    .padding(3)
                }
            }
            .navigationTitle("Victims")
            .onAppear{
                
                viewModel.fetch()
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
