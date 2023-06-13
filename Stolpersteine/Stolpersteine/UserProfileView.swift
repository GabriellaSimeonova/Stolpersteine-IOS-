//
//  UserProfileView.swift
//  Stolpersteine
//
//  Created by Gabriela Simeonova on 06/06/2023.


//import SwiftUI
//
//struct UserProfileView: View {
//    @State private var isStonesVisitedSheetPresented = false
//    @State private var isCandlesLitSheetPresented = false
//    @State private var isStonesSavedSheetPresented = false
//
//
//    let darkBrown = Color(hex: "7F462C")
//    let brown2 = Color(hex: "C67F59")
//    let brown3 = Color(hex: "D89B78")
//
//
//
//
//    var body: some View {
//        VStack(spacing: 20) {
//            Text("Your Profile").font(Font.title2)
//
//            CircleView(title: "Stones Visited", number: "1", color: darkBrown)
//                .onTapGesture {
//                    isStonesVisitedSheetPresented = true
//                }
//                .sheet(isPresented: $isStonesVisitedSheetPresented) {
//                    Text("Stones Visited Sheet")
//                }
//
//            CircleView(title: "Candles Lit", number: "3", color: brown2)
//                .onTapGesture {
//                    isCandlesLitSheetPresented = true
//                }
//                .sheet(isPresented: $isCandlesLitSheetPresented) {
//                    Text("Candles Lit Sheet")
//                }
//
//            CircleView(title: "Stones Saved", number: "0", color: brown3)
//                .onTapGesture {
//                    isStonesSavedSheetPresented = true
//                }
//                .sheet(isPresented: $isStonesSavedSheetPresented) {
//                    Text("Stones Saved Sheet")
//                }
//        }.padding(.top, -90)
//               .padding()
//           }
//       }
//
//struct CircleView: View {
//    var title: String
//    var number: String
//    var color: Color
//
//    var body: some View {
//        VStack {
//            ZStack {
//                Circle()
//                    .foregroundColor(color)
//                    .frame(width: 120, height: 120)
//
//                Text(number)
//                    .font(.system(size: 40))
//                    .foregroundColor(.white)
//            }
//            Text(title)
//                .font(.system(size: 20))
//        }
//    }
//}
//
//    struct UserProfileView_Previews: PreviewProvider {
//        static var previews: some View {
//            UserProfileView()
//        }
//    }

















import SwiftUI

enum Language: String {
    case english = "en"
    case dutch = "nl"
    case french = "fr"
}

struct UserProfileView: View {
    @State private var isStonesVisitedSheetPresented = false
    @State private var isCandlesLitSheetPresented = false
    @State private var isStonesSavedSheetPresented = false
    @State private var isLanguageSelectionSheetPresented = false

//    @State  var language = Language.english
    @EnvironmentObject var languageManager:LanguageManager

    let darkBrown = Color(hex: "7F462C")
    let brown2 = Color(hex: "C67F59")
    let brown3 = Color(hex: "D89B78")

  
 
    var body: some View {
        VStack(spacing: 20) {
            ZStack(alignment: .topTrailing) {

                Text("profile".localized())
                    .font(.title2)
                    .bold()
                    .padding()
            }

            CircleView(title:"Stones Visited".localized(), number: "1", color: darkBrown)
                .onTapGesture {
                    isStonesVisitedSheetPresented = true
                }
                .sheet(isPresented: $isStonesVisitedSheetPresented) {
                    Text(NSLocalizedString("Stones Visited Sheet", comment: ""))
                }

            CircleView(title: NSLocalizedString("Candles Lit", comment: ""), number: "3", color: brown2)
                .onTapGesture {
                    isCandlesLitSheetPresented = true
                }
                .sheet(isPresented: $isCandlesLitSheetPresented) {
                    Text(NSLocalizedString("Candles Lit Sheet", comment: ""))
                }

            CircleView(title: NSLocalizedString("Stones Saved", comment: ""), number: "0", color: brown3)
                .onTapGesture {
                    isStonesSavedSheetPresented = true
                }
                .sheet(isPresented: $isStonesSavedSheetPresented) {
                    Text(NSLocalizedString("Stones Saved Sheet", comment: ""))
                }

            Button(action: {
                languageManager.switchLanguage()
            }) {
                Text(NSLocalizedString("Select Language", comment: ""))
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.blue)
                    .cornerRadius(10)
            }
            
        }
        .padding(.top, -90)
        .padding()
    }
}

struct CircleView: View {
    var title: String
    var number: String
    var color: Color

    var body: some View {
        VStack {
            ZStack {
                Circle()
                    .foregroundColor(color)
                    .frame(width: 120, height: 120)

                Text(number)
                    .font(.system(size: 40))
                    .foregroundColor(.white)
            }
            Text(title)
                .font(.system(size: 20))
        }
    }
}


    
    struct UserProfileView_Previews: PreviewProvider {
        static var previews: some View {
            Group{
                //            UserProfileView()
                //                .environment(\.locale, Locale.init(identifier: Language.RawValue.StringLiteralType()))
                UserProfileView()
                //                .environment(\.locale, Locale.init(identifier: "en"))
                //
                //            UserProfileView()
                //                .environment(\.locale, Locale.init(identifier: "fr"))
                
            }
            
        }
    }

