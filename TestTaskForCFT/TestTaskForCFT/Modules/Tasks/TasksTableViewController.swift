//
//  ViewController.swift
//  TestTaskForCFT
//
//  Created by Kazakov Danil on 01.02.2023.
//

import UIKit

class TasksTableViewController: UIViewController {
    
    private let tasksViewModel = TasksViewModel()
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
            self.tasksViewModel.callAlert(controller: self)
            self.tasksViewModel.saveTask()
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
        
        cell.backgroundColor = .clear
        cell.selectionStyle = .none
        cell.layer.cornerRadius = 10
        cell.layer.shadowRadius = 9
        cell.layer.shadowOpacity = 0.3
        cell.layer.shadowOffset = CGSize(width: 5, height: 5)
        cell.layer.masksToBounds = true
        cell.clipsToBounds = false
        
        cell.taskLabel.text = tasksViewModel.tasks[indexPath.section].description
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
        
        return tasksViewModel.tasks.count
    }
    
    func tableView(
        _ tableView: UITableView,
        numberOfRowsInSection section: Int
    ) -> Int {
        
        return 1
    }
}


extension TasksTableViewController {
    
    func reloadTableView() {
        DispatchQueue.main.async { [weak self] in
            self?.reloadTableView()
        }
    }
    
    override func touchesBegan(
        _ touches: Set<UITouch>,
        with event: UIEvent?
    ) {
        super.touchesBegan(touches, with: event)
        
        self.tasksViewModel.taskAlert.dismissAlert()
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
            button.trailingAnchor.constraint(
                equalTo: view.trailingAnchor, constant: -20
            ),
            button.bottomAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20
            ),
            button.heightAnchor.constraint(
                equalToConstant: 80
            ),
            button.widthAnchor.constraint(
                equalToConstant: 80
            )
        ])
    }
    
}
