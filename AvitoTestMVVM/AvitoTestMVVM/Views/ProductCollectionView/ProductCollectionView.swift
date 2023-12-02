//
//  ProductCollectionView.swift
//  AvitoTestMVVM
//
//  Created by Денис Ерыгин on 22.11.2023.
//

import UIKit
import Kingfisher

final class ProductCollectionView: UICollectionView {
    
// MARK: - Properties
    
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
    
// MARK: - Func
    
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
        
        let advertisment = viewModel.advertismentsData.value.advertisements[indexPath.item]
        let url = URL(string: advertisment.imageUrl)
        cell.imageView.kf.setImage(with: url)
        cell.configureProductCell(item: advertisment)
        
        return cell
    }
}

// MARK: - UICollectionViewDelegateFlowLayout

extension ProductCollectionView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: 170, height: 290)
    }
}

// MARK: - UICollectionViewDelegate

extension ProductCollectionView: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let advertisment = viewModel.advertismentsData.value.advertisements[indexPath.item]
        
        let detailViewContoller = DetailViewController(detailId: advertisment.id)
        
        if let navigationController = self.window?.rootViewController as? UINavigationController {
            navigationController.pushViewController(detailViewContoller, animated: true)
        } else {
            print("Ошибка: rootViewController не является UINavigationController")
        }
    }
}
