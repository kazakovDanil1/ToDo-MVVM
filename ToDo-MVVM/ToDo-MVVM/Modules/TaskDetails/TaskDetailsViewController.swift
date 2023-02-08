//
//  TaskDetailsViewController.swift
//  ToDo-MVVM
//
//  Created by Kazakov Danil on 07.02.2023.
//

import UIKit


class TaskDetailsViewController: UIViewController {
    
    lazy var contentView = self.view as? TaskDetailsView
    
    let viewModel = TaskDetailsViewModel()
    
    override func loadView() {
        self.view = TaskDetailsView(frame: UIScreen.main.bounds)
    }
    
    override func viewDidLoad() {
        addTargetToButton()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        fillContentView()
    }
    
    @objc func updateTask() {
        guard let task = viewModel.task else {
            return
        }
        self.viewModel.getTask(
            task: task,
            newDescription: contentView?.taskView.text ?? "nil"
        )
        navigationController?.popViewController(animated: true)
    }
    
    func fillContentView() {
        contentView?.taskLabel.text = viewModel.task?.deadLine
        contentView?.taskView.text = viewModel.task?.description
        contentView?.taskCount.text = viewModel.task?.number
    }
}

extension TaskDetailsViewController {
    func addTargetToButton() {
        contentView?.button.addTarget(
            nil,
            action: #selector(updateTask),
            for: .touchUpInside
        )
    }
    
}
