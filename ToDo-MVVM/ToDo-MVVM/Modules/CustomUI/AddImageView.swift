//
//  AddImageView.swift
//  ToDo-MVVM
//
//  Created by Kazakov Danil on 09.02.2023.
//

import UIKit


class addImageView: UIView {

//    let imageLabel = CustomLabel(
//        size: 10,
//        weight: .light,
//        title: "ДОБАВИТЬ ФОТО"
//    )
    
    let screenShotImage: UIImageView = {
        let image = UIImageView()
        image.backgroundColor = UIColor(named: "taskCellColor")?.withAlphaComponent(0.1)
        image.tintColor = UIColor(named: "taskCellColor")
        image.layer.masksToBounds = true
        image.layer.cornerRadius = 20
        image.contentMode = .scaleAspectFit
        
        return image
    }()
    
//    
//    let plusImageForScreenShot: UIImageView = {
//        let image = UIImageView()
//        image.image = UIImage(systemName: "plus")
//        image.tintColor = UIColor(named: "taskCellColor")
//       
//        return image
//    }()
//
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
