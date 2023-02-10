//
//  AddImageView.swift
//  ToDo-MVVM
//
//  Created by Kazakov Danil on 09.02.2023.
//

import UIKit


class addImageView: UIView {
    
    let screenShotImage: UIImageView = {
        let image = UIImageView()
        image.backgroundColor = UIColor(named: "taskCellColor")?.withAlphaComponent(0.1)
        image.tintColor = UIColor(named: "taskCellColor")
        image.layer.masksToBounds = true
        image.layer.cornerRadius = 20
        image.contentMode = .scaleAspectFit
        
        return image
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        translatesAutoresizingMaskIntoConstraints = false
        self.frame.size = CGSize(width: 100, height: 100)
        self.backgroundColor = .blue
        self.isUserInteractionEnabled = true
        screenShotImage.frame = self.frame
        self.addSubview(screenShotImage)
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
}
