//
//  UIView + addSubview.swift
//  Exam37Lesson
//
//  Created by Nazar on 02.07.2025.
//

import UIKit

extension UIView {
    func addSubviews(_ views: UIView...) {
        for view in views {
            addSubview(view)
        }
    }
}
