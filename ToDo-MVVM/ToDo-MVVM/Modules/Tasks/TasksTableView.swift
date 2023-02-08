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
        translatesAutoresizingMaskIntoConstraints = false
        register(
            TaskCell.self,
            forCellReuseIdentifier: TaskCell.identifier
        )
        backgroundColor = #colorLiteral(red: 0.117298089, green: 0.1247704551, blue: 0.162137419, alpha: 1)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


