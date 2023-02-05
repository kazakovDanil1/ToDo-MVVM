//
//  circleButton.swift
//  TestTaskForCFT
//
//  Created by Kazakov Danil on 03.02.2023.
//

import UIKit

class CircleButton: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        translatesAutoresizingMaskIntoConstraints = false
        clipsToBounds = true
        backgroundColor = .white
        setImage(UIImage(systemName: "plus"), for: .normal)
        imageView?.layer.transform = CATransform3DMakeScale(1.8, 1.8, 2.5)
    }

    convenience init(action: Selector) {
        self.init(frame: .zero)
        self.addTarget(nil, action: action, for: .touchUpInside)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
