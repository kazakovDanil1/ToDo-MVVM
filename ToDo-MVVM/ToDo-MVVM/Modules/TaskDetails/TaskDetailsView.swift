//
//  TaskDetailsView.swift
//  ToDo-MVVM
//
//  Created by Kazakov Danil on 07.02.2023.
//

import UIKit

class TaskDetailsView: UIView {
    
    private let contentView = MainView()
    
    let taskLabel = CustomLabel(size: 20, weight: .bold)
    let taskView = CustomViewField(cornerRadius: 20)
    let button = customButton()
    
    var addImage = addImageView()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        layoutSubviews()
        updateConstraintsIfNeeded()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        commonInit()
        addViews()
    }
    
    func addViews() {
        contentView.addSubview(taskLabel)
        contentView.addSubview(taskView)
        contentView.addSubview(button)
        contentView.addSubview(addImage)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension TaskDetailsView {
    
    func commonInit() {
        addSubview(contentView)
        contentView.frame = self.bounds
    }
    
    override func updateConstraintsIfNeeded() {
        super.updateConstraintsIfNeeded()
        
        NSLayoutConstraint.activate([
            taskLabel.topAnchor.constraint(
                equalTo: contentView.safeAreaLayoutGuide.topAnchor,
                constant: 20
            ),
            taskView.topAnchor.constraint(
                equalTo: taskLabel.bottomAnchor, constant: 20
            ),
            taskLabel.centerXAnchor.constraint(
                equalTo: contentView.centerXAnchor
            ),
            taskView.centerXAnchor.constraint(
                equalTo: taskLabel.centerXAnchor
            ),
            taskView.leadingAnchor.constraint(
                equalTo: contentView.leadingAnchor, constant: 30
            ),
            taskView.trailingAnchor.constraint(
                equalTo: contentView.trailingAnchor, constant: -30
            ),
            taskView.heightAnchor.constraint(
                equalToConstant: 100
            ),
            button.topAnchor.constraint(
                equalTo: taskView.bottomAnchor, constant: 20
            ),
            button.centerXAnchor.constraint(
                equalTo: taskView.centerXAnchor
            ),
            button.heightAnchor.constraint(
                equalToConstant: 80
            ),
            button.leadingAnchor.constraint(
                equalTo: taskView.leadingAnchor, constant: 20
            ),
            button.trailingAnchor.constraint(
                equalTo: taskView.trailingAnchor, constant: -20
            ),
            addImage.topAnchor.constraint(
                equalTo: button.bottomAnchor, constant: 20
            ),
            addImage.screenShotImage.centerXAnchor.constraint(
                equalTo: contentView.centerXAnchor
            )
        ])
    }
    
}

