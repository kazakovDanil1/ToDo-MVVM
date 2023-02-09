//
//  TasksViewModel.swift
//  TestTaskForCFT
//
//  Created by Kazakov Danil on 01.02.2023.
//

import Foundation
import UIKit.UIViewController
import UIKit.UIImage

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
        let date = getCurrentDate()
        
        taskAlert.grabTask { [weak self] text in
            if !(text).isEmpty {
                let task = Task(
                    description: "\(text)",
                    deadLine: date,
                    completionStatus: false,
                    number: "\(taskIdentifier)",
                    photo: nil
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
    
    func getCurrentDate() -> String {
        let time = Date(timeIntervalSinceNow: 10800)
        var timeString = String(describing: time)
        
        if let dotRange = timeString.range(of: " +") {
            timeString.removeSubrange(
                dotRange.lowerBound..<timeString.endIndex
            )
        }
        let last4 = String(timeString.suffix(8))
        
        return last4
    }
}
