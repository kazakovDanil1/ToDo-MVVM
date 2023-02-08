//
//  TaskDetailsView.swift
//  ToDo-MVVM
//
//  Created by Kazakov Danil on 07.02.2023.
//

import UIKit

class TaskDetailsView: UIView {
    
    private let contentView = UIView()
    
    let taskLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 20, weight: .bold)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    let taskCount: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 20, weight: .bold)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    let button: UIButton = {
        let button = UIButton()
        button.frame.size = CGSize(width: 100, height: 100)
        button.backgroundColor = .blue
        button.setTitle("update task", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    
    let taskView = CustomViewField(cornerRadius: 20)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.backgroundColor = .white
        
        layoutSubviews()
        updateConstraintsIfNeeded()
    }
    
    func addViews() {
        contentView.addSubview(taskLabel)
        contentView.addSubview(taskView)
        contentView.addSubview(taskCount)
        contentView.addSubview(button)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        commonInit()
        addViews()
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
            taskCount.bottomAnchor.constraint(
                equalTo: taskLabel.topAnchor, constant: -20
            ),
            taskCount.centerXAnchor.constraint(
                equalTo: taskLabel.centerXAnchor
            ),
            taskLabel.bottomAnchor.constraint(
                equalTo: taskView.topAnchor, constant: -20
            ),
            taskLabel.centerXAnchor.constraint(
                equalTo: taskView.centerXAnchor
            ),
            
            taskView.centerXAnchor.constraint(
                equalTo: contentView.centerXAnchor
            ),
            taskView.centerYAnchor.constraint(
                equalTo: contentView.centerYAnchor
            ),
            taskView.widthAnchor.constraint(
                equalToConstant: 200
            ),
            taskView.heightAnchor.constraint(
                equalToConstant: 300
            ),
            
            button.topAnchor.constraint(
                equalTo: taskView.bottomAnchor, constant: 20
            ),
            button.centerXAnchor.constraint(
                equalTo: taskView.centerXAnchor
            )
        ])
    }
    
}
