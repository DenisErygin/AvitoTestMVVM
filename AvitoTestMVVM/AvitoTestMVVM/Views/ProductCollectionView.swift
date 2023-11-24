//
//  ProductCollectionView.swift
//  AvitoTestMVVM
//
//  Created by Денис Ерыгин on 22.11.2023.
//

import UIKit

final class ProductCollectionView: UICollectionView {
    
    // MARK: - Private properties

    private let collectionLayout = UICollectionViewFlowLayout()
    
    private let viewModel = MainViewModel()
    
    // MARK: - Initialization
    
    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        super.init(frame: frame, collectionViewLayout: collectionLayout)
        
        register(ProductCell.self, forCellWithReuseIdentifier: ProductCell.idCell)
        
        setupLayout()
        setDelegates()
        bindViewModel()
        viewModel.fetchAdvertisments()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Private func
    
    private func setupLayout() {
        translatesAutoresizingMaskIntoConstraints = false
        collectionLayout.minimumLineSpacing = 10
        collectionLayout.scrollDirection = .vertical
        self.showsVerticalScrollIndicator = false
    }
    
    private func setDelegates() {
        dataSource = self
        delegate = self
    }
    
    private func bindViewModel() {
        viewModel.advertismentsData.bind { [weak self] _ in
            DispatchQueue.main.async {
                self?.reloadData()
            }
        }
    }
}

// MARK: - UICollectionViewDataSource

extension ProductCollectionView: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        viewModel.numberOfItems()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ProductCell.idCell, for: indexPath) as? ProductCell else { return UICollectionViewCell() }
        
        let advertisment = viewModel.advertismentsData.value.advertisements
        cell.configureProductCell(item: advertisment[indexPath.item])
        
//        print(advertisment)
 
        return cell
    }
}

// MARK: - UICollectionViewDelegateFlowLayout

extension ProductCollectionView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: 170, height: 270)
    }
}
