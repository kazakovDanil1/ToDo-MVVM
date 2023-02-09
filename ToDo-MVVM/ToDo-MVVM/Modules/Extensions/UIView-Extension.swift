//
//  UIView-Extension.swift
//  ToDo-MVVM
//
//  Created by Kazakov Danil on 08.02.2023.
//

import UIKit

extension UIView {
    func makeShadows(radius: Int, color: CGColor, shadowOpacity: Float) {
        self.layer.shadowOffset = CGSize(width: 10, height: 10)
        self.layer.shadowColor = color
        self.layer.shadowRadius = CGFloat(radius)
        self.layer.shadowOpacity = shadowOpacity
    }
}
