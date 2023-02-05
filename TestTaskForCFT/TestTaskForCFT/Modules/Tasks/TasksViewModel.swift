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
    
    func createTask(controller: UIViewController) {
        taskAlert.showAlert(
            title: "Hello",
            message: "hello",
            controller: controller
        )
    }
    
}
