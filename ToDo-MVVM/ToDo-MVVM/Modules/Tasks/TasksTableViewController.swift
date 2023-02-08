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
        
        tasksViewModel.getTasks()
        addSubviews()
        setNavigationController()
        setTableViewControllerDelegates()
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
            self.tasksViewModel.addTask()
        }
    }
    
}

extension TasksTableViewController: TaskDetailsViewModelDelegate {
    func updateTask(task: Task) {
        let newTask = task

        if let row = tasksViewModel.tasks.firstIndex(where: {
            $0.number == newTask.number }
        ) {
            self.tasksViewModel.tasks[row] = newTask
            self.tasksTableView.reloadData()
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
        
        let detailsViewController = TaskDetailsViewController()
        
        let task = tasksViewModel.tasks[indexPath.section]
        
        let detailsViewModel = TaskDetailsViewModel { myTask in
            detailsViewController.viewModel.task = myTask
        }
        
        detailsViewModel.grabTask?(task)
        
        detailsViewController.viewModel.delegate = self
        
        navigationController?.pushViewController(
            detailsViewController, animated: true
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
        setupCustomizationFor(cell)
        
        cell.taskLabel.text = tasksViewModel.tasks[
            indexPath.section
        ].description
        
        cell.deadLineLabel.text = tasksViewModel.tasks[
            indexPath.section
        ].deadLine
        
        return cell
    }
    
    
    func tableView(
        _ tableView: UITableView,
        heightForHeaderInSection section: Int
    ) -> CGFloat {
        10
    }
    
    func tableView(
        _ tableView: UITableView,
        heightForRowAt indexPath: IndexPath
    ) -> CGFloat {
        80
    }
    
    func tableView(
        _ tableView: UITableView,
        numberOfRowsInSection section: Int
    ) -> Int {
        1
    }
    
    func numberOfSections(
        in tableView: UITableView
    ) -> Int {
        tasksViewModel.numberOfRowsInSection()
    }
}


extension TasksTableViewController {
    
    func setupCustomizationFor(_ cell: TaskCell) {
        cell.backgroundColor = .clear
        cell.selectionStyle = .none
        cell.layer.cornerRadius = 10
        cell.layer.shadowRadius = 9
        cell.layer.shadowOpacity = 0.4
        cell.layer.shadowOffset = CGSize(width: 5, height: 8)
        cell.layer.masksToBounds = true
        cell.clipsToBounds = false
        
        cell.cellView.layer.cornerRadius = 8
        cell.cellView.layer.masksToBounds = true
    }
    
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
    
    func setNavigationController() {
        navigationItem.title = "Tasks"
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    func setTableViewFrame() {
        tasksTableView.frame = view.bounds
    }
    
    func addSubviews() {
        view.addSubview(tasksTableView)
        tasksTableView.addSubview(button)
    }
    
    func setTableViewControllerDelegates() {
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
