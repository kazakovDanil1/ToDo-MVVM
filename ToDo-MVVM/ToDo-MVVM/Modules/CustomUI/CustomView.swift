//
//  CustomView.swift
//  ToDo-MVVM
//
//  Created by Kazakov Danil on 08.02.2023.
//

import UIKit


class CustomView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = UIColor(named: "taskCellColor")
    }
    
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    
}

