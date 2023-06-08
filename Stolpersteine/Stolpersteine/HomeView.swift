//
//  HomeView.swift
//  Stolpersteine
//
//  Created by Gabriela Simeonova on 06/06/2023.
//
//
//import SwiftUI
//
//struct Victim: Hashable,  Codable{
//    let name: String
//    let city: String
//    let address: String
//    let dateOfBirth: String?
//    let dateOfPassing: String?
//    let placeOfPassing: String?
//    let reasonOfPassing: String?
////    let officialStone: Bool
////    let address: String
////    let gender: String
////    let photo: String
////    let url: String
////    let niodUrl: String
////    let mapUrl: String
//}
//
//class ViewModel: ObservableObject {
//    @Published var victims: [Victim] = []
//
//    func fetch() {
//        guard let url = URL(string: "https://api.struikelstenengids.nl/v2/export/stones?secret=yONOtKGoGO9u9O8pC247jKl9NcDxEl54C2b8N06nzgF9WR6S1I&fbclid=IwAR2JETryTuv4SY-SBm6PoPOrSkhbPWJ2tUDl724lFkqn25jFYz82Oc5Pk1c") else {
//            return
//        }
//
//        let task = URLSession.shared.dataTask(with: url) { [weak self] data, _, error in
//            guard let data = data, error == nil else {
//                return
//            }
//
//            do {
//                let victims = try JSONDecoder().decode([Victim].self, from: data)
//                DispatchQueue.main.async {
//                    self?.victims = victims
////                    if let firstVictim = victims.first {
////                        print("Address: \(type(of: firstVictim.address))")
////                        print("reasonOfPassing: \(type(of: firstVictim.reasonOfPassing))")
////                        print("dateOfBirth: \(type(of: firstVictim.dateOfBirth))")
////                        print("dateOfPassing: \(type(of: firstVictim.dateOfPassing))")
////                        print("placeOfPassing: \(type(of: firstVictim.placeOfPassing))")
////
////                    }
//                }
//            } catch {
//                print(error)
//            }
//        }
//        task.resume()
//    }
//}
//
//
//
//struct HomeView: View {
//    @StateObject var viewModel = ViewModel()
//
//    var body: some View {
//        NavigationView {
//            VStack {
//                Text("Stolperstein of the Day")
//                    .font(.title)
//                    .foregroundColor(Color(hex: "7F462C"))
//                    .bold()
//                    .padding(.top)
//
//                CandleLightningView()
//
//
//                ScrollView(.horizontal, showsIndicators: false) {
//                    VStack(alignment: .leading){
//                        Text("Closest to you")
//                            .font(.title2)
//                            .bold()
//                            .foregroundColor(Color(hex: "7F462C"))
//                            .padding(.bottom)
//
//                        LazyHStack(spacing: 10) {
//                            ForEach(viewModel.victims.prefix(5), id: \.self) { victim in
//                                NavigationLink(destination: StoneProfileView()) {
//                                    VStack {
//                                        Image("NoPicture")
//                                            .resizable()
//                                            .aspectRatio(contentMode: .fit)
//                                            .frame(width: 80, height: 80)
//
//                                        Text(victim.name)
//                                            .bold()
//                                            .multilineTextAlignment(.center)
//                                    }
//                                    .padding(10)
//                                    .background(Color.white)
//                                    .cornerRadius(10)
//                                }
//                            }
//                        }
//                    }
//                    .padding()
//                }
//                .background(Color(red: 0.988, green: 0.961, blue: 0.941))
//                .foregroundColor(Color(hex: "7F462C"))
//                .onAppear {
//                    viewModel.fetch()
//                }
//
//                ScrollView(.horizontal, showsIndicators: false) {
//                    VStack(alignment: .leading) {
//                        Text("Passed away on this day")
//                            .font(.title2)
//                            .bold()
//                            .foregroundColor(Color(hex: "7F462C"))
//                            .padding(.bottom)
//
//                        LazyHStack(spacing: 10) {
//                            ForEach(viewModel.victims.suffix(5), id: \.self) { victim in
//                                NavigationLink(destination: StoneProfileView()) {
//                                    VStack {
//                                        Image("NoPicture")
//                                            .resizable()
//                                            .aspectRatio(contentMode: .fit)
//                                            .frame(width: 80, height: 80)
//
//                                        Text(victim.name)
//                                            .bold()
//                                            .multilineTextAlignment(.center)
//                                    }
//                                    .padding(10)
//                                    .background(Color.white)
//                                    .cornerRadius(10)
//                                }
//                            }
//                        }
//                    }
//                    .padding()
//                }
//                .background(Color(red: 0.988, green: 0.961, blue: 0.941))
//                .foregroundColor(Color(hex: "7F462C"))
//            }
//            .background(Color(red: 0.988, green: 0.961, blue: 0.941))
//        }
//        .navigationViewStyle(StackNavigationViewStyle())
//    }
//}
//
//
//
//struct HomeView_Previews: PreviewProvider {
//    static var previews: some View {
//        HomeView()
//    }
//}


import SwiftUI

struct Victim: Hashable, Codable {
    let name: String
    let city: String
    let address: String
    let dateOfBirth: String?
    let dateOfPassing: String?
    let placeOfPassing: String?
    let reasonOfPassing: String?
}

class ViewModel: ObservableObject {
    @Published var victims: [Victim] = []
    @Published var isLoading: Bool = false
    
    func fetch() {
        isLoading = true
        
        guard let url = URL(string: "https://api.struikelstenengids.nl/v2/export/stones?secret=yONOtKGoGO9u9O8pC247jKl9NcDxEl54C2b8N06nzgF9WR6S1I&fbclid=IwAR2JETryTuv4SY-SBm6PoPOrSkhbPWJ2tUDl724lFkqn25jFYz82Oc5Pk1c") else {
            isLoading = false
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { [weak self] data, _, error in
            guard let data = data, error == nil else {
                self?.isLoading = false
                return
            }
            
            do {
                let victims = try JSONDecoder().decode([Victim].self, from: data)
                DispatchQueue.main.async {
                    self?.victims = victims
                    self?.isLoading = false
                }
            } catch {
                print(error)
                self?.isLoading = false
            }
        }
        task.resume()
    }
}

struct HomeView: View {
    @StateObject var viewModel = ViewModel()
    @State private var isFirstAppear = true

    var body: some View {
        NavigationView {
            Group {
                if isFirstAppear || viewModel.isLoading {
                    EmptyViewWithLoader()
                } else {
                    ScrollView {
                        VStack {
                            Text("Stolperstein of the Day")
                                .font(.title)
                                .foregroundColor(Color(hex: "7F462C"))
                                .bold()
                                .padding(.top)
                                .padding(.bottom, 20)

                            CandleLightningView()

                            ScrollView(.horizontal, showsIndicators: false) {
                                VStack(alignment: .leading) {
                                    Text("Closest to you")
                                        .font(.title2)
                                        .bold()
                                        .foregroundColor(Color(hex: "7F462C"))
                                        .padding(.bottom)
                                    
                                    LazyHStack(spacing: 10) {
                                        ForEach(viewModel.victims.prefix(5), id: \.self) { victim in
                                            NavigationLink(destination: StoneProfileView(victim: victim)){
                                                VStack {
                                                    Image("NoPicture")
                                                        .resizable()
                                                        .aspectRatio(contentMode: .fit)
                                                        .frame(width: 80, height: 80)
                                                    
                                                    Text(victim.name)
                                                        .bold()
                                                        .multilineTextAlignment(.center)
                                                }
                                                .padding(10)
                                                .background(Color.white)
                                                .cornerRadius(10)
                                            }
                                        }
                                    }
                                }
                                .padding()
                            }
                            .background(Color(red: 0.988, green: 0.961, blue: 0.941))
                            .foregroundColor(Color(hex: "7F462C"))

                            ScrollView(.horizontal, showsIndicators: false) {
                                VStack(alignment: .leading) {
                                    Text("Passed away on this day")
                                        .font(.title2)
                                        .bold()
                                        .foregroundColor(Color(hex: "7F462C"))
                                        .padding(.bottom)
                                    
                                    LazyHStack(spacing: 10) {
                                        ForEach(viewModel.victims.suffix(5), id: \.self) { victim in
                                            NavigationLink(destination: StoneProfileView(victim: victim)) {
                                                VStack {
                                                    Image("NoPicture")
                                                        .resizable()
                                                        .aspectRatio(contentMode: .fit)
                                                        .frame(width: 80, height: 80)
                                                    
                                                    Text(victim.name)
                                                        .bold()
                                                        .multilineTextAlignment(.center)
                                                }
                                                .padding(10)
                                                .background(Color.white)
                                                .cornerRadius(10)
                                            }
                                        }
                                    }
                                }
                                .padding()
                            }
                            .background(Color(red: 0.988, green: 0.961, blue: 0.941))
                            .foregroundColor(Color(hex: "7F462C"))
                        }
                        .padding()
                    }
                }
            }
            .background(Color(red: 0.988, green: 0.961, blue: 0.941))
            .onAppear {
                if isFirstAppear {
                    viewModel.fetch()
                    isFirstAppear = false
                }
            }
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

struct EmptyViewWithLoader: View {
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                Color(red: 0.988, green: 0.961, blue: 0.941)
                
                VStack {
                    ProgressView()
                        .padding(.vertical, 20)
                }
            }
            .frame(width: geometry.size.width, height: geometry.size.height)
        }
        .ignoresSafeArea()
    }
}

//struct StoneProfileView: View {
//    // Rest of the code for StoneProfileView
//}
//
//struct CandleLightningView: View {
//    // Rest of the code for CandleLightningView
//}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

