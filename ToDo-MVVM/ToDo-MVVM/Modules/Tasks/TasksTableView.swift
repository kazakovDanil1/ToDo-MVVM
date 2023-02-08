//
//  TasksTableView.swift
//  TestTaskForCFT
//
//  Created by Kazakov Danil on 01.02.2023.
//

import UIKit

class TasksTableView: UITableView {
    
    override init(frame: CGRect, style: UITableView.Style) {
        super.init(frame: .zero, style: .grouped)
        register(
            TaskCell.self,
            forCellReuseIdentifier: TaskCell.identifier
        )
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = UIColor(named: "mainColor")
        
        sectionFooterHeight = 5
        sectionHeaderHeight = 5
        showsVerticalScrollIndicator = false
        separatorStyle = .none
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


