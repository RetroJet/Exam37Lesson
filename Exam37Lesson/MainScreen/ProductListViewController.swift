//
//  ViewController.swift
//  Exam37Lesson
//
//  Created by Nazar on 30.06.2025.
//

import UIKit

class ProductListController: UITableViewController {
    var productManager: IProductManager!
    
    private let identifier = "products"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    //MARK: -> UITableViewDelegate
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        tableView.bounds.height * 0.33
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    //MARK: -> UITableViewDataSource
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        ProductCategory.allCases.count
    }
    
    //MARK: -> UIUITableViewCell
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: identifier,
            for: indexPath) as? HorizontalScrollView else {
            return UITableViewCell()
        }
        
        let category = ProductCategory.allCases[indexPath.row]
        let products = productManager.getProducts(for: category)
        
        cell.configure(category: category.rawValue, products: products)
        cell.action = presentDetailsVC
        cell.selectionStyle = .none
        return cell
    }
    
    private func presentDetailsVC(id: Int) {
        guard let product = productManager.getProductDetails(id: id) else { return }
        let detailsVC = DetailsViewController()
        detailsVC.configure(product: product)
        present(detailsVC, animated: true)
    }
}

//MARK: -> Setup View
private extension ProductListController {
    func setup() {
        setupBackground()
        setupTableView()
    }
    
    func setupBackground() {
        view.backgroundColor = .white
    }
    
    func setupTableView() {
        tableView.separatorStyle = .none
        tableView.isScrollEnabled = false
        tableView.register(HorizontalScrollView.self, forCellReuseIdentifier: identifier)
        
        tableView.contentInset = UIEdgeInsets(top: 55, left: 0, bottom: 0, right: 0)
    }
}
