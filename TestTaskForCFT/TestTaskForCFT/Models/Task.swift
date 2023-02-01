//
//  Task.swift
//  TestTaskForCFT
//
//  Created by Kazakov Danil on 01.02.2023.
//

import Foundation

struct Task {
    
    let name: String
    let description: String
    let date: String
    let completionStatus: Bool
    
    static func createTask() -> [Task] {
        let tasks = [
            Task(
                name: "Example",
                description: "do something",
                date: "01.01.01",
                completionStatus: false
            )
        ]
        
        return tasks
    }
    
}
