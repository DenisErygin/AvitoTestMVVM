//
//  ProductCollectionView.swift
//  AvitoTestMVVM
//
//  Created by Денис Ерыгин on 22.11.2023.
//

import UIKit

final class ProductCollectionView: UICollectionView {
    
    private let collectionLayout = UICollectionViewFlowLayout()
    
    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        super.init(frame: frame, collectionViewLayout: collectionLayout)
        
        setupLayout()
        setDelegates()
        
        register(ProductCell.self, forCellWithReuseIdentifier: ProductCell.idCell)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupLayout() {
        translatesAutoresizingMaskIntoConstraints = false
        collectionLayout.minimumLineSpacing = 5
        collectionLayout.scrollDirection = .vertical
    }
    
    private func setDelegates() {
        dataSource = self
        delegate = self
    }
}

// MARK: - UICollectionViewDataSource

extension ProductCollectionView: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ProductCell.idCell, for: indexPath) as? ProductCell else { return UICollectionViewCell() }
 
        return cell
    }
}

// MARK: - UICollectionViewDelegateFlowLayout

extension ProductCollectionView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: 170, height: 200)
    }
}
