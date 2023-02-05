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
    private let button = CircleButton(action: #selector(createNewTask))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addSubviews()
        setupNavigationController()
        setupTableViewControllerDelegates()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        setTableViewFrame()
        setConstraints()
        
        button.layer.cornerRadius = 40
    }
    
    @objc func createNewTask() {
        DispatchQueue.main.async {
            self.taskViewModel.callAlert(controller: self)
        }
    }
    
}

extension TasksTableViewController:
    UITableViewDelegate,
    UITableViewDataSource {
    
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
    
    func tableView(
        _ tableView: UITableView,
        heightForHeaderInSection section: Int
    ) -> CGFloat {
        
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


extension TasksTableViewController {
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        
        self.taskViewModel.taskAlert.dismissAlert()
    }
    
    func setupNavigationController() {
        navigationItem.title = "hello"
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    func setTableViewFrame() {
        tasksTableView.frame = view.bounds
    }
    
    func addSubviews() {
        view.addSubview(tasksTableView)
        tasksTableView.addSubview(button)
    }
    
    func setupTableViewControllerDelegates() {
        tasksTableView.delegate = self
        tasksTableView.dataSource = self
    }
    
    func setConstraints() {
        NSLayoutConstraint.activate([
            button.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            button.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20),
            button.heightAnchor.constraint(equalToConstant: 80),
            button.widthAnchor.constraint(equalToConstant: 80)
        ])
    }
    
}
