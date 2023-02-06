//
//  TasksViewModel.swift
//  TestTaskForCFT
//
//  Created by Kazakov Danil on 01.02.2023.
//

import Foundation
import UIKit.UIViewController

class TasksViewModel {
    
    var tasks: [Task] = []
    
    let taskAlert = TaskAlert()
    
    func callAlert(controller: UIViewController) {
        taskAlert.showAlert(
            title: "Hello",
            message: "hello",
            controller: controller)
    }
    
    func saveTask() {
        let vc = TasksTableViewController()
        
        
        taskAlert.create { text in
            if !(text).isEmpty {
                
                let task = Task(
                    name: "Example",
                    description: "\(text)",
                    date: "01.01.01",
                    completionStatus: false
                )
                
                self.tasks.append(task)
                self.taskAlert.dismissAlert()
                vc.reloadTableView()
            } 
        }
    }
    
    
}
