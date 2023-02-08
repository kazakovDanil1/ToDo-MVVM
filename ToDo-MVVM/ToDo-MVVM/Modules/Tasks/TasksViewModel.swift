//
//  TasksViewModel.swift
//  TestTaskForCFT
//
//  Created by Kazakov Danil on 01.02.2023.
//

import Foundation
import UIKit.UIViewController

class TasksViewModel {
    
    let taskAlert = TaskAlert()
    
    var tasks: [Task] = Task.createTask()
    
    func callAlert(
        controller: UIViewController
    ) {
        taskAlert.showAlert(
            controller: controller
        )
    }
    
    func saveTask() {
        var counterNumber = tasks.count
        let vc = TasksTableViewController()
        
        taskAlert.grabTask { [weak self] text in
            if !(text).isEmpty {
                
                let task = Task(
                    description: "\(text)",
                    deadLine: "01.01.01",
                    completionStatus: false,
                    number: counterNumber
                )
                
                self?.tasks.append(task)
                self?.taskAlert.dismissAlert()
                counterNumber += 1
                vc.reloadTableView()
            } 
        }
    }
    
    func numberOfRowsInSection() -> Int {
        return tasks.count
    }
    
}
