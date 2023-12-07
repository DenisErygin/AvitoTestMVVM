//
//  DetailViewController.swift
//  AvitoTestMVVM
//
//  Created by Денис Ерыгин on 29.11.2023.
//

import Foundation
import UIKit

final class DetailViewController: UIViewController {
    
    // MARK: - Properties
    
    private var detailViewModel = DetailViewModel()
    
    private let detailView = DetailView()
    
    private let detailId: String
    
    // MARK: - Initialization
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        setConstrains()
        detailViewModel.fetchDetailsAdvertisment(id: detailId)
        bindDetailViewModel()
    }
    
    init(detailId: String) {
        self.detailViewModel = DetailViewModel()
        self.detailId = detailId
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Func
    
    private func bindDetailViewModel() {
        detailViewModel.detailData.bind { [weak self] detailData in
            DispatchQueue.main.async {
                self?.configureDetailData()
            }
        }
    }
    
    private func configureDetailData() {
        
        let detail = detailViewModel.detailData.value
        
        detailView.titleLabel.text = detail.title
        detailView.priceLabel.text = detail.price
        detailView.locationLabel.text = detail.location
        detailView.descriptionLabel.text = detail.description
        detailView.emailLabel.text = detail.email
        detailView.phoneNumberLabel.text = detail.phoneNumber
        detailView.addressLabel.text = detail.address
        
        let url = URL(string: detail.imageURL)
        detailView.imageView.kf.setImage(with: url)
        
        detailView.dateLabel.text = DateFormatterManager.createDateFrom(string: detail.createdDate)
    }
}

// MARK: - Extension DetailView

private extension DetailViewController {
    
    func setupUI() {
        
        view.backgroundColor = .white
        view.addSubview(detailView)
    }
    
    func setConstrains() {
        NSLayoutConstraint.activate([
            
            detailView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            detailView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            detailView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            detailView.widthAnchor.constraint(equalTo: view.widthAnchor),
            detailView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}
