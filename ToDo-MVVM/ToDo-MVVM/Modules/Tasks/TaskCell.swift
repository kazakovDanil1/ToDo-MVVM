//
//  TaskCell.swift
//  TestTaskForCFT
//
//  Created by Kazakov Danil on 01.02.2023.
//

import UIKit

class TaskCell: UITableViewCell {
    
    static let identifier = "TaskCell"
    
    lazy var taskLabel = CustomLabel(
        size: 20, weight: .semibold
    )
    lazy var deadLineLabel = CustomLabel(
        size: 20, weight: .semibold
    )
    lazy var cellView = CustomView()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        layoutIfNeeded()
        updateConstraintsIfNeeded()
    }
    
    override func layoutIfNeeded() {
        contentView.addSubview(cellView)
        cellView.frame = contentView.bounds
        
        addCellSubviews()
    }
    
    func addCellSubviews() {
        cellView.addSubview(taskLabel)
        cellView.addSubview(deadLineLabel)
    }
    
    override func prepareForReuse() {
        taskLabel.text = nil
        deadLineLabel.text = nil
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension TaskCell {
    override func updateConstraintsIfNeeded() {
        NSLayoutConstraint.activate([
            cellView.leadingAnchor.constraint(
                equalTo: contentView.leadingAnchor, constant: 5
            ),
            cellView.trailingAnchor.constraint(
                equalTo: contentView.trailingAnchor, constant: -5
            ),
            cellView.topAnchor.constraint(
                equalTo: contentView.topAnchor
            ),
            cellView.bottomAnchor.constraint(
                equalTo: contentView.bottomAnchor
            ),
            taskLabel.centerYAnchor.constraint(
                equalTo: cellView.centerYAnchor
            ),
            taskLabel.leadingAnchor.constraint(
                equalTo: cellView.leadingAnchor, constant: 20
            ),
            deadLineLabel.centerYAnchor.constraint(
                equalTo: cellView.centerYAnchor
            ),
            deadLineLabel.trailingAnchor.constraint(
                equalTo: cellView.trailingAnchor, constant: -20
            )
        ])
    }
}
