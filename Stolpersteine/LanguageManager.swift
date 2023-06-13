//
//  LanguageManager.swift
//  Stolpersteine
//
//  Created by Tsveta Pandurska on 13/06/2023.
//

import SwiftUI
import Combine


class LanguageManager: ObservableObject {
    static let shared = LanguageManager()

    @Published var currentLanguage: String = "en"

    func switchLanguage() {
        switch currentLanguage {
        case "en":
            currentLanguage = "fr"
        case "fr":
            currentLanguage = "nl"
        case "nl":
            currentLanguage = "en"
        default:
            currentLanguage = "en"
        }
        print(currentLanguage)
    }
}

extension String {
    func localized() -> String {
        let path = Bundle.main.path(forResource: LanguageManager.shared.currentLanguage, ofType: "lproj")
        let bundle = Bundle(path: path!)

        return NSLocalizedString(self, bundle: bundle!, comment: "")
    }
}
