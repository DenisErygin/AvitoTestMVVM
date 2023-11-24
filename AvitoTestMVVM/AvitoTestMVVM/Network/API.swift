//
//  API.swift
//  AvitoTestMVVM
//
//  Created by Денис Ерыгин on 23.11.2023.
//

import Foundation

struct API {
    
    static let mainPageURL = "https://www.avito.st/s/interns-ios/main-page.json"
    
    static func detailsURL(id: String) -> String {
        return "https://www.avito.st/s/interns-ios/details//\(id).json"
    }
}
