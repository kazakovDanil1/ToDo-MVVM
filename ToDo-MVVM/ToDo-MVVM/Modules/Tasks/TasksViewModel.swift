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
    
    let storageManager = StorageManager.shared
    
    let taskAlert = TaskAlert()
    
    var tasks: [Task] = Task.createTask()
    
    func getAllTasks(){
        guard let context = storageManager.appDelegateContainer else {
            return 
        }
        do {
            let coreDataContainer = try context.fetch(
                TaskModel.fetchRequest()
            )
            coreDataContainer.forEach { container in
                if let taskData = container.task {
                    tasks = storageManager.decode(taskAsData: taskData)
                }
            }
        } catch {
            print("Error - \(error.localizedDescription)")
        }
        
        storageManager.updateOrCreateDataContainer(byNew: tasks)

    }
    
    func createTask() {
        let taskIdentifier = UUID()
        let date = getCurrentDate()
        let vc = TasksTableViewController()
        
        DispatchQueue.main.async { [weak self] in
            self?.taskAlert.grabTask { [weak self] text in
                guard let self = self else { return }
                if !(text).isEmpty {
                    let task = Task(
                        description: "\(text)",
                        deadLine: date,
                        completionStatus: false,
                        number: "\(taskIdentifier)",
                        photo: nil
                    )
                    self.tasks.append(task)
                    self.storageManager.updateOrCreateDataContainer(byNew: self.tasks)
                    vc.reloadTable()
                    self.taskAlert.dismissAlert()
                }
            }
        }
    }
    
    func callAlert(
        controller: UIViewController
    ) {
        DispatchQueue.main.async { [weak self] in
            self?.taskAlert.showAlert(
                controller: controller
            )
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
        let last3 = String(last4.prefix(5))
        
        return last3
    }
}
