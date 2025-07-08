//
//  Repository.swift
//  Exam37Lesson
//
//  Created by Nazar on 02.07.2025.
//

protocol IProductRepository {
    func getProducts() -> [Product]
}

class ProductRepository {
    func getProducts() -> [Product] {
        [
            Product(id: 0,
                    title: "Bread",
                    description: "Freshly baked bread with a soft inside and crispy crust.",
                    imageName: "Bread",
                    price: 2.50,
                    category: .grainsAndBread
                   ),
            
            Product(id: 1,
                    title: "Beef",
                    description: "High-quality beef, rich in protein and perfect for grilling.",
                    imageName: "Beef",
                    price: 7.50,
                    category: .meatAndPoultry
                   ),
            
            Product(id: 2,
                    title: "Butter",
                    description: "Creamy and rich butter, perfect for spreading, baking, or cooking.",
                    imageName: "Butter",
                    price: 2.20,
                    category: .dairyProducts
                   ),
            
            Product(id: 3,
                    title: "Cheese",
                    description: "Rich and creamy cheese for everyday use.",
                    imageName: "Cheese",
                    price: 2.50,
                    category: .dairyProducts
                   ),
            
            Product(id: 4,
                    title: "Chicken",
                    description: "Tender and lean chicken, perfect for grilling or roasting.",
                    imageName: "Chicken",
                    price: 5.50,
                    category: .meatAndPoultry
                   ),
            
            Product(id: 5,
                    title: "Eggs",
                    description: "Fresh eggs, great for cooking, baking, or breakfast.",
                    imageName: "Eggs",
                    price: 3.00,
                    category: .meatAndPoultry
                   ),
            
            Product(id: 6,
                    title: "Milk",
                    description: "Fresh milk, rich and creamy, perfect for drinking or cooking.",
                    imageName: "Milk",
                    price: 2.00,
                    category: .dairyProducts
                   ),
            
            Product(id: 7,
                    title: "Pasta",
                    description: "Classic pasta made from durum wheat, perfect for your favorite sauces.",
                    imageName: "Pasta",
                    price: 3.00,
                    category: .grainsAndBread
                   ),
            
            Product(id: 8,
                    title: "Rice",
                    description: "Versatile and fluffy rice, ideal as a side or main dish base.",
                    imageName: "Rice",
                    price: 2.75,
                    category: .grainsAndBread
                   )
        ]
    }
}
