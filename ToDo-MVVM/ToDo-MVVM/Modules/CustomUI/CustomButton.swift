//
//  CustomButton.swift
//  ToDo-MVVM
//
//  Created by Kazakov Danil on 08.02.2023.
//

import UIKit

class customButton: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        translatesAutoresizingMaskIntoConstraints = false
        layer.cornerRadius = 35
        titleLabel?.font = .systemFont(ofSize: 24, weight: .heavy)
        setTitle("ИЗМЕНИТЬ", for: .normal)
        setTitleColor(UIColor(named: "taskCellColor"), for: .normal)
        backgroundColor = .white
        tintColor = .black
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    
}
