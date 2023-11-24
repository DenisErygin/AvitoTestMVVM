//
//  ImageService.swift
//  AvitoTestMVVM
//
//  Created by Денис Ерыгин on 24.11.2023.
//

import Foundation
import UIKit

class ImageService {
    
    func loadImage(from url: URL, completion: @escaping (UIImage?) -> Void) {
        URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data, error == nil else {
                print("Error loading image: \(error?.localizedDescription ?? "Unknown error")")
                completion(nil)
                return
            }

            DispatchQueue.main.async {
                if let image = UIImage(data: data) {
                    completion(image)
                } else {
                    completion(nil)
                }
            }
        }.resume()
    }
}
