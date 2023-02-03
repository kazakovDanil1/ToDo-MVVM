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
    
    lazy var taskLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 20, weight: .semibold)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        layoutIfNeeded()
        
        updateConstraintsIfNeeded()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutIfNeeded() {
        contentView.addSubview(cellView)
        
        cellView.frame = contentView.bounds
        
        addCellSubviews()
    }
    
    func addCellSubviews() {
        cellView.addSubview(taskLabel)
    }
    
    override func prepareForReuse() {
        taskLabel.text = nil
    }
    
    override func updateConstraintsIfNeeded() {
        NSLayoutConstraint.activate([
            cellView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            cellView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            cellView.topAnchor.constraint(equalTo: contentView.topAnchor),
            cellView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            
            
            taskLabel.centerYAnchor.constraint(equalTo: cellView.centerYAnchor),
        ])
    }
    
}
