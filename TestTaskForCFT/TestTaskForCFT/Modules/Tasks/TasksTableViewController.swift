//
//  ViewController.swift
//  TestTaskForCFT
//
//  Created by Kazakov Danil on 01.02.2023.
//

import UIKit

class TasksTableViewController: UIViewController {

    private let taskViewModel = TasksViewModel()
    private let tasksTableView = TasksTableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(tasksTableView)
        setupNavigationController()
        setupTableViewControllerDelegates()
    }
    
    func setupNavigationController() {
        navigationItem.title = "hello"
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    
    func setupTableViewControllerDelegates() {
        tasksTableView.delegate = self
        tasksTableView.dataSource = self
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tasksTableView.frame = view.bounds
    }
}

extension TasksTableViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(
        _ tableView: UITableView,
        didSelectRowAt indexPath: IndexPath
    ) {
        tableView.deselectRow(at: indexPath, animated: true)

        navigationController?.pushViewController(
            TaskDetailsViewController(),
            animated: true
        )
        
    }
    
    func tableView(
        _ tableView: UITableView,
        cellForRowAt indexPath: IndexPath
    ) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: TaskCell.identifier,
            for: indexPath) as? TaskCell else {
            
            return UITableViewCell()
        }
        
        cell.taskLabel.text = "welcome"
        cell.cellView.backgroundColor = .blue
        
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 100
    }
    
    func numberOfSections(
        in tableView: UITableView
    ) -> Int {
        
        return 3
    }
    
    func tableView(
        _ tableView: UITableView,
        numberOfRowsInSection section: Int
    ) -> Int {
        
        return 1
    }
}
