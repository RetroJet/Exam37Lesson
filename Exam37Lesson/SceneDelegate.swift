//
//  SceneDelegate.swift
//  Exam37Lesson
//
//  Created by Nazar on 30.06.2025.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: windowScene)
        
        let repository = ProductRepository()
        let productManager: IProductManager = ProductManager(products: repository.getProducts())
        
        let productListViewController = ProductListController()
        
        productListViewController.productManager = productManager
        
        window?.rootViewController = productListViewController
        window?.makeKeyAndVisible()
    }
}

