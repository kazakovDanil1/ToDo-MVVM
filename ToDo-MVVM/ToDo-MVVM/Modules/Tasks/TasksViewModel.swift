//
//  TasksViewModel.swift
//  TestTaskForCFT
//
//  Created by Kazakov Danil on 01.02.2023.
//

import Foundation
import UIKit.UIViewController

enum DefaultsKeys {
    static let savedTasks = "savedTasks"
}

class TasksViewModel {
    
    let taskAlert = TaskAlert()
    
    var tasks: [Task] = Task.createTask()
    
    func getTasks() {
        if let myData = UserDefaults.standard.value(
            forKey: DefaultsKeys.savedTasks
        ) as? Data {
            guard let savedTasks = try? PropertyListDecoder().decode(
                [Task].self, from: myData
            ) else { return }
            self.tasks = savedTasks
        }
    }
    
    func addTask() {
        let vc = TasksTableViewController()
        let taskIdentifier = UUID()
        
        taskAlert.grabTask { [weak self] text in
            if !(text).isEmpty {
                let task = Task(
                    description: "\(text)",
                    deadLine: "01.01.01",
                    completionStatus: false,
                    number: "\(taskIdentifier)"
                )
                self?.tasks.append(task)
                self?.saveTask()
                self?.taskAlert.dismissAlert()
                vc.reloadTableView()
            }
            
        }
    }
    
    func callAlert(
        controller: UIViewController
    ) {
        taskAlert.showAlert(
            controller: controller
        )
    }
    
    func saveTask() {
        if let data = try? PropertyListEncoder().encode(tasks) {
            UserDefaults.standard.set(data, forKey: DefaultsKeys.savedTasks)
        }
    }
    
    func numberOfRowsInSection() -> Int {
        return tasks.count
    }
}

        
    

