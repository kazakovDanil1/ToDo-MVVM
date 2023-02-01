//
//  ViewController.swift
//  TestTaskForCFT
//
//  Created by Kazakov Danil on 01.02.2023.
//

import UIKit

class TasksViewController: UIViewController {

    private let taskViewModel = TasksViewModel()
    
    private let tasksTableView = TasksTableViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .blue
        view.addSubview(tasksTableView)
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        tasksTableView.frame = view.bounds
    }
}

