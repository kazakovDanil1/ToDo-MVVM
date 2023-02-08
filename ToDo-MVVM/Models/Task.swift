//
//  Task.swift
//  TestTaskForCFT
//
//  Created by Kazakov Danil on 01.02.2023.
//

import Foundation

struct Task: Codable {
    
    let description: String
    let deadLine: String
    let completionStatus: Bool
    let number: String
    
    static func createTask() -> [Task] {
        let tasks = [
            Task(
                description: "do something",
                deadLine: "01.01.01",
                completionStatus: false,
                number: "000"
            )
        ]
        
        return tasks
    }
    
}
