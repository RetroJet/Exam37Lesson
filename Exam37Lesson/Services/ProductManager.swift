//
//  ProductManager.swift
//  Exam37Lesson
//
//  Created by Nazar on 01.07.2025.
//

protocol IProductManager {
    func getAllProducts() -> [Product]
    func getProducts(for category: ProductCategory) -> [Product]
    func getProductDetails(id: Int) -> Product?
}

class ProductManager {
    private var products: [Product] = []
    
    init(products: [Product]) {
        self.products = products
    }
}

extension ProductManager: IProductManager {
    func getAllProducts() -> [Product] {
        products
    }
    
    func getProducts(for category: ProductCategory) -> [Product] {
        return products.filter { $0.category == category }
    }
    
    func getProductDetails(id: Int) -> Product? {
        products.first { $0.id == id }
    }
}
