//
//  TaskDetailsView.swift
//  TestTaskForCFT
//
//  Created by Kazakov Danil on 01.02.2023.
//

import UIKit

class TaskDetailsView: UIView {

    let contentView = UIView(frame: .zero)
    
    override init(frame: CGRect = CGRect.zero) {
        super.init(frame: frame)

        contentView.backgroundColor = .white
        layoutIfNeeded()
    }
    
    override func layoutIfNeeded() {
        super.layoutIfNeeded()
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func commonInit(){
        addSubview(contentView)
        contentView.frame = self.bounds
    }
    
}
