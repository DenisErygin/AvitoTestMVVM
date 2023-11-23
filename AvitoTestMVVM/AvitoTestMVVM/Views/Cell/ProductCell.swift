//
//  ProductCell.swift
//  AvitoTestMVVM
//
//  Created by Денис Ерыгин on 22.11.2023.
//

import UIKit

final class ProductCell: UICollectionViewCell {
    
    static let idCell = "ProductCell"
    
    // MARK: - Private properties
    
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 10
        return imageView
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16)
        return label
    }()
    
    private let priceLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        return label
    }()
    
    private let locationLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        return label
    }()
    
    private let dateLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12)
        label.textColor = .gray
        return label
    }()
    
    // MARK: - Initialization
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupView()
        setConstrains()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - UI

private extension ProductCell {
    
    func setupView() {
        backgroundColor = .gray
        layer.cornerRadius = 30
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        priceLabel.translatesAutoresizingMaskIntoConstraints = false
        locationLabel.translatesAutoresizingMaskIntoConstraints = false
        dateLabel.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(imageView)
        addSubview(titleLabel)
        addSubview(priceLabel)
        addSubview(locationLabel)
        addSubview(dateLabel)
    }
}

// MARK: - Constrains

private extension ProductCell {
    
    func setConstrains() {
        NSLayoutConstraint.activate([
            
            imageView.topAnchor.constraint(equalTo: topAnchor),
            imageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            imageView.heightAnchor.constraint(equalToConstant: 150),
            
            titleLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 10),
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            
            priceLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 5),
            priceLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            
            locationLabel.topAnchor.constraint(equalTo: priceLabel.bottomAnchor, constant: 5),
            locationLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            
            dateLabel.topAnchor.constraint(equalTo: locationLabel.bottomAnchor, constant: 5),
            dateLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            dateLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10)
        ])
    }
}
