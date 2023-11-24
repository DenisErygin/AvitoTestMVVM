//
//  NetworkService.swift
//  AvitoTestMVVM
//
//  Created by Денис Ерыгин on 23.11.2023.
//

import Foundation

final class NetworkService {
    
    static let shared = NetworkService()
    
    func fetchData<T: Decodable>(
        url: URL,
        completion: @escaping (Result<T, Error>) -> Void
    ) {
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            
            guard let data = data, error == nil else {
                return completion(.failure(error!))
            }
            
            do {
                let decodedData = try JSONDecoder().decode(T.self, from: data)
                completion(.success(decodedData))
            } catch {
                completion(.failure(error))
            }
        } .resume()
    }
}
