//
//  UIView+Extension.swift
//  RetrospectDiary
//
//  Created by Seungui Moon on 2023/09/12.
//

import UIKit

extension UIView {
    func applyShadow(cornerRadius: CGFloat) {
        layer.masksToBounds = false
        layer.shadowColor = UIColor.red.cgColor
        layer.shadowOpacity = 1
        layer.shadowOffset = CGSize(width: 0, height: 5)
        layer.shadowRadius = 2.0
        layer.cornerRadius = cornerRadius
    }
}
