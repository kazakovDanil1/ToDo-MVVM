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
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        fillContentView()
    }
    
    func fillContentView() {
        contentView?.taskLabel.text = viewModel.task?.deadLine
        contentView?.taskView.text = viewModel.task?.description
        contentView?.taskCount.text = (
            String(
                describing: viewModel.task?.number
            )
        )
    }
    
}
