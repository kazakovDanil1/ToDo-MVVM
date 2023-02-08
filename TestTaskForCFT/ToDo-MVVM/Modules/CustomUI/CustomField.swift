//
//  CustomField.swift
//  TestTaskForCFT
//
//  Created by Kazakov Danil on 05.02.2023.
//

import UIKit

final class CustomField: UITextField {

    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
    }
    
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        return CGRect.init(
            x: 10,
            y: 0,
            width: bounds.width - 20,
            height: bounds.height
        )
    }
    
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return CGRect.init(
            x: 10,
            y: -50,
            width: bounds.width - 20,
            height: bounds.height
        )
    }
    
    override func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        return CGRect.init(
            x: 10,
            y: 0,
            width: bounds.width - 20,
            height: bounds.height
        )
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
