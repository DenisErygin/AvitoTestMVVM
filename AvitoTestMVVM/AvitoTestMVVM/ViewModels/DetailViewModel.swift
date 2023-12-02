//
//  DetailViewModel.swift
//  AvitoTestMVVM
//
//  Created by Денис Ерыгин on 29.11.2023.
//

import Foundation

final class DetailViewModel {
    
    var detailData = Dynamic(Details(id: "", title: "", price: "", location: "", imageURL: "", createdDate: "", description: "", email: "", phoneNumber: "", address: ""))
    
    func fetchDetailsAdvertisment(id: String) {
        
        guard let url = URL(string: API.detailsURL(id: id)) else { return }
        
        NetworkService.shared.fetchData(url: url) { (result: Result<Details, Error>) in
            switch result {
            case .success(let response):
                self.detailData.value = response
            
            case .failure(let error):
                print("Ошибка при получении данных: \(error)")
            }
        }
    }
}
