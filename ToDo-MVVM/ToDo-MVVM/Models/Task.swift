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
    let photo: Data?
    
    static func createTask() -> [Task] {
        let tasks = [
            Task(
                description: "do something",
                deadLine: "14:55",
                completionStatus: false,
                number: "000",
                photo: nil
                
            )
        ]
        
        return tasks
    }
    
}
