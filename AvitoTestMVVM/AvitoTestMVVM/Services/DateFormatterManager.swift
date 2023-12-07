//
//  DateFormatterManager.swift
//  AvitoTestMVVM
//
//  Created by Денис Ерыгин on 07.12.2023.
//

import Foundation

struct DateFormatterManager {
    
    static func createDateFrom(string: String) -> String? {
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        dateFormatter.locale = Locale(identifier: "ru_RU")

        guard let date = dateFormatter.date(from: string) else { return nil }
        
        dateFormatter.dateFormat = "d MMMM, yyyy"
        return dateFormatter.string(from: date)
    }
}
