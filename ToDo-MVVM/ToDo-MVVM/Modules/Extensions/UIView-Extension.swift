//
//  UIView-Extension.swift
//  ToDo-MVVM
//
//  Created by Kazakov Danil on 08.02.2023.
//

import UIKit

extension UIView {
    func makeShadows(radius: Int) {
        self.layer.shadowOffset = CGSize(width: 10, height: 10)
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowRadius = CGFloat(radius)
        self.layer.shadowOpacity = 0.40
    }
}
