//
//  TaskCell.swift
//  TestTaskForCFT
//
//  Created by Kazakov Danil on 01.02.2023.
//

import UIKit

final class TaskCell: UITableViewCell {
    
    static let identifier = "TaskCell"
    
    let cellView = UIView()
    
    private lazy var taskLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 20, weight: .semibold)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Hello"
        
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        cellView.backgroundColor = .blue
        
        layoutSubviews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        contentView.addSubview(cellView)
        
        addCellSubviews()
        updateConstraints()
    }
    
    func addCellSubviews() {
        cellView.addSubview(taskLabel)
        
    }
    
    override func prepareForReuse() {
        taskLabel.text = nil
    }
    
    override func updateConstraints() {
        NSLayoutConstraint.activate([
            taskLabel.centerYAnchor.constraint(equalTo: cellView.centerYAnchor),
        ])
    }
    
}
