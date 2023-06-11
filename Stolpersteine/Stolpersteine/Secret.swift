//
//  Secret.swift
//  Stolpersteine
//
//  Created by Gabriela Simeonova on 11/06/2023.
//

import Foundation

enum Secret {
    static let yourOpenAIAPIKey = ProcessInfo.processInfo.environment["OPENAI_API_KEY"] ?? ""
}
