//
//  MainView.swift
//  ToDo-MVVM
//
//  Created by Kazakov Danil on 08.02.2023.
//

import UIKit

class MainView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = UIColor(named: "mainColor")
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }

}
