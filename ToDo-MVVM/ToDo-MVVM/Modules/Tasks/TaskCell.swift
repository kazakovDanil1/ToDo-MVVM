//
//  TaskCell.swift
//  TestTaskForCFT
//
//  Created by Kazakov Danil on 01.02.2023.
//

import UIKit

class TaskCell: UITableViewCell {
    
    static let identifier = "TaskCell"
    
    lazy var taskLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 20, weight: .semibold)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    lazy var deadLineLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 20, weight: .semibold)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    lazy var cellView: UIView = {
        let view = UIView()
        view.backgroundColor = .blue
        
        return view
    }()
    
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
                equalTo: contentView.leadingAnchor
            ),
            cellView.trailingAnchor.constraint(
                equalTo: contentView.trailingAnchor
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
