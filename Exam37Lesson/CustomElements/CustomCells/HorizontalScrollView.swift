//
//  HorizontalScrollView.swift
//  Exam37Lesson
//
//  Created by Nazar on 03.07.2025.
//

import UIKit

class HorizontalScrollView: UITableViewCell {
    var action: ((Int) -> ())?
    
    private let scrollView = UIScrollView()
    private let stackView = UIStackView()
    private let categoryLabel = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setup()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(category: String, products: [Product]) {
        categoryLabel.text = category
        stackView.arrangedSubviews.forEach { $0.removeFromSuperview() }
        
        for product in products {
            let view = ProductCustomView()
            view.configure(data: product)
            view.action = tapView
            stackView.addArrangedSubview(view)
        }
    }
    
    private func tapView(_ id: Int) {
        action?(id)
    }
}

//MARK: -> Setup Views
private extension HorizontalScrollView {
    func setup() {
        setupView()
        setupLabel()
        setupStackView()
        setupLayout()
    }
    
    func setupView() {
        contentView.addSubviews(
            scrollView,
            categoryLabel
        )
        scrollView.addSubview(stackView)
    }
    
    func setupLabel() {
        categoryLabel.font = .boldSystemFont(ofSize: 20)
    }
    
    func setupStackView() {
        stackView.axis = .horizontal
        stackView.spacing = 20
        stackView.alignment = .center
    }
}

//MARK: -> Auto Layout
private extension HorizontalScrollView {
    func setupLayout() {
        autoResizingMask(
            scrollView,
            stackView,
            categoryLabel
        )
        
        NSLayoutConstraint.activate([
            categoryLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 80),
            categoryLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 13),
            categoryLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -13),
            
            scrollView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 120),
            scrollView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            scrollView.heightAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: 0.7),
            
            stackView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 13),
            stackView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -13),
            stackView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            stackView.topAnchor.constraint(equalTo: scrollView.topAnchor)
        ])
    }
}
