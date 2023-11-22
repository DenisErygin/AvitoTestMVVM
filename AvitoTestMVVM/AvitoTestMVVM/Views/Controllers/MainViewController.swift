//
//  ViewController.swift
//  AvitoTestMVVM
//
//  Created by Денис Ерыгин on 22.11.2023.
//

import UIKit

final class MainViewController: UIViewController {
    
    private let productCollectionView = ProductCollectionView()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        setConstrains()
    }
}

// MARK: - UI / Constrains

private extension MainViewController {
    
    func setupUI() {
        view.backgroundColor = .white
        view.addSubview(productCollectionView)
    }
    
    func setConstrains() {
        NSLayoutConstraint.activate([
            productCollectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            productCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            productCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            productCollectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -20)
        ])
    }
}

