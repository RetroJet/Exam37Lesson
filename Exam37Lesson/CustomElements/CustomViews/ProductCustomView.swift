//
//  ProductCustomView.swift
//  Exam37Lesson
//
//  Created by Nazar on 02.07.2025.
//

import UIKit

class ProductCustomView: UIView {
    var action: ((Int) -> ())?
    
    private let productImage = UIImageView()
    private let productTitle = UILabel()
    private let productDescription = UILabel()
    private let productPrice = UILabel()
    private var product: Product?
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        setup()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        layer.shadowPath = UIBezierPath(roundedRect: bounds, cornerRadius: layer.cornerRadius).cgPath
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        UIView.animate(
            withDuration: 0.04) {
                self.alpha = 0.6
            } completion: { _ in
                self.alpha = 1
            }
        action?(product?.id ?? 0)
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(data: Product) {
        productImage.image = UIImage(named: data.imageName)
        productTitle.text = data.title
        productDescription.text = data.description
        productPrice.text = String(format: "%.2f€", data.price)
        
        self.product = data
    }
}

//MARK: -> Setup Views
private extension ProductCustomView {
    func setup() {
        setupBackgroundColor()
        addSubviews()
        setupShadow()
        setupView()
        setupImage()
        setupLabel()
        setupLayout()
    }
    
    func addSubviews() {
        addSubviews(
            productImage,
            productTitle,
            productPrice,
            productDescription
        )
    }
    
    func setupView() {
        layer.cornerRadius = 15
        widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width * 0.94).isActive = true
        heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height * 0.18).isActive = true
        
    }
    
    func setupBackgroundColor() {
        backgroundColor = UIColor(
            cgColor: CGColor(red: 230/255, green: 230/255, blue: 250/255, alpha: 1)
        )
    }
    
    func setupShadow() {
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOpacity = 0.3
        layer.shadowOffset = CGSize(width: 5, height: 5)
        layer.shadowRadius = 10
    }
    
    func setupLabel() {
        productTitle.font = .boldSystemFont(ofSize: 20)
        productDescription.numberOfLines = 0
        productDescription.font = .systemFont(ofSize: 15)
        productPrice.font = .systemFont(ofSize: 22)
    }
    
    func setupImage() {
        productImage.layer.cornerRadius = 15
        productImage.clipsToBounds = true
        productImage.contentMode = .scaleAspectFill
    }
}

//MARK: Auto Layout
private extension ProductCustomView {
    func setupLayout() {
        autoResizingMask(
            productImage,
            productTitle,
            productDescription,
            productPrice
        )
        
        NSLayoutConstraint.activate([
            productImage.widthAnchor.constraint(equalToConstant: 100),
            productImage.heightAnchor.constraint(equalToConstant: 100),
            productImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            productImage.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            
            productTitle.leadingAnchor.constraint(equalTo: productImage.trailingAnchor, constant: 16),
            productTitle.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            productTitle.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            
            productDescription.leadingAnchor.constraint(equalTo: productImage.trailingAnchor, constant: 16),
            productDescription.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            productDescription.topAnchor.constraint(equalTo: productTitle.bottomAnchor, constant: 10),
            
            productPrice.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10),
            productPrice.leadingAnchor.constraint(equalTo: productImage.trailingAnchor, constant: 16),
            productPrice.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16)
        ])
        
    }
}
