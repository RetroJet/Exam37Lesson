//
//  Untitled.swift
//  Exam37Lesson
//
//  Created by Nazar on 03.07.2025.
//

import UIKit

extension UIView {
    func autoResizingMask(_ views: UIView...) {
        for view in views {
            view.translatesAutoresizingMaskIntoConstraints = false
        }
    }
}
