//
//  Untitled.swift
//  Exam37Lesson
//
//  Created by Nazar on 01.07.2025.
//

import UIKit

struct Product {
    let id: Int
    let title: String
    let description: String
    let imageName: String
    let price: Double
    let category: ProductCategory
}

enum ProductCategory: String {
    case grainsAndBread = "Grains and Bread"
    case meatAndPoultry = "Meat and Poultry"
    case dairyProducts = "Dairy Products"
}

extension ProductCategory: CaseIterable {}
