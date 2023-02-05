//
//  CustomViewField.swift
//  TestTaskForCFT
//
//  Created by Kazakov Danil on 05.02.2023.
//

import UIKit

class CustomViewField: UITextView {

    override init(frame: CGRect, textContainer: NSTextContainer?) {
        super.init(frame: frame, textContainer: textContainer)
        
        layer.borderColor = UIColor.systemGray.cgColor
        font = UIFont.systemFont(ofSize: 18.0, weight: .bold)
        textColor = UIColor.black
        textAlignment = NSTextAlignment.left
        dataDetectorTypes = UIDataDetectorTypes.all
        isEditable = true
        textColor = .white
        backgroundColor = .clear
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
