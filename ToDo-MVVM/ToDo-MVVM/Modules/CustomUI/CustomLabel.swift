//
//  CustomLabel.swift
//  ToDo-MVVM
//
//  Created by Kazakov Danil on 08.02.2023.
//

import UIKit

class CustomLabel: UILabel {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        translatesAutoresizingMaskIntoConstraints = false
        textColor = .white
    }
    
    convenience init(size: CGFloat, weight: UIFont.Weight) {
        self.init(frame: .zero)
        font = .systemFont(ofSize: size, weight: weight)
    }
    
    convenience init(size: CGFloat, weight: UIFont.Weight, title: String) {
        self.init(frame: .zero)
        font = .systemFont(ofSize: size, weight: weight)
        text = title
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
}
