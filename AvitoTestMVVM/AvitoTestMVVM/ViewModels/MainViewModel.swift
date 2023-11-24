//
//  MainViewModel.swift
//  AvitoTestMVVM
//
//  Created by Денис Ерыгин on 23.11.2023.
//

import Foundation

final class MainViewModel {
    
    var advertismentsData = Dynamic(AdvertisementResponse(advertisements: []))
    
    func numberOfItems() -> Int {
        advertismentsData.value.advertisements.count
    }
    
    func fetchAdvertisments() {
        
        guard let url = URL(string: API.mainPageURL) else { return }
        
        NetworkService.shared.fetchData(url: url) { (result: Result<AdvertisementResponse, Error>) in
            switch result {
            case .success(let response):
                self.advertismentsData.value = response
            
            case .failure(let error):
                print("Ошибка при получении данных: \(error)")
            }
        }
    }
}
