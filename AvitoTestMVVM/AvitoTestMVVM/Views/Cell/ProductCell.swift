//
//  ProductCell.swift
//  AvitoTestMVVM
//
//  Created by Денис Ерыгин on 22.11.2023.
//

import UIKit

final class ProductCell: UICollectionViewCell {
    
    static let idCell = "ProductCell"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupView()
        setConstrains()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - UI / Constrains

private extension ProductCell {
    
     func setupView() {
        backgroundColor = .gray
        layer.cornerRadius = 30
    }
    
     func setConstrains() {
        NSLayoutConstraint.activate([
        
        
        ])
    }
}
