//
//  DetailsViewController.swift
//  Exam37Lesson
//
//  Created by Nazar on 08.07.2025.
//

import UIKit

class DetailsViewController: UIViewController {
    private let productImage = UIImageView()
    private let productTitle = UILabel()
    private let productDescription = UILabel()
    private let productPrice = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    func configure(product: Product?) {
        productImage.image = UIImage(named: product?.imageName ?? "")
        productTitle.text = product?.title
        productDescription.text = product?.description
        productPrice.text = String(format: "%.2f€", product?.price ?? 0.0)
    }
}

//MARK: -> Setup View
private extension DetailsViewController {
    func setup() {
        setupBackgrondColor()
        setupView()
        setupImage()
        setupLabel()
        setupLayout()
    }
    
    func setupView() {
        view.addSubviews(
            productImage,
            productTitle,
            productDescription,
            productPrice
        )
    }
    
    func setupBackgrondColor() {
        view.backgroundColor = UIColor(
            cgColor: CGColor(red: 230/255, green: 230/255, blue: 250/255, alpha: 1)
        )
    }
    
    func setupImage() {
        productImage.layer.cornerRadius = 15
        productImage.clipsToBounds = true
    }
    
    func setupLabel() {
        productTitle.font = .boldSystemFont(ofSize: 20)
        
        productDescription.font = .systemFont(ofSize: 16)
        productDescription.textAlignment = .center
        productDescription.numberOfLines = 0
        
        productPrice.font = .boldSystemFont(ofSize: 22)
    }
}

//MARK: -> Auto Layout
private extension DetailsViewController {
    func setupLayout() {
        view.autoResizingMask(
            productImage,
            productTitle,
            productDescription,
            productPrice
        )
        
        NSLayoutConstraint.activate([
            productImage.heightAnchor.constraint(equalToConstant: 200),
            productImage.widthAnchor.constraint(equalToConstant: 200),
            productImage.topAnchor.constraint(equalTo: view.topAnchor, constant: 20),
            productImage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            productTitle.topAnchor.constraint(equalTo: productImage.bottomAnchor, constant: 20),
            productTitle.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            productDescription.topAnchor.constraint(equalTo: productTitle.bottomAnchor, constant: 20),
            productDescription.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            productDescription.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            productDescription.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            productPrice.topAnchor.constraint(equalTo: productDescription.bottomAnchor, constant: 40),
            productPrice.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
}
