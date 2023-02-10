//
//  StorageManager.swift
//  ToDo-MVVM
//
//  Created by Kazakov Danil on 10.02.2023.
//

import Foundation
import UIKit
import CoreData


class StorageManager {
    
    static let shared = StorageManager()
    
    let appDelegateContainer = (
        UIApplication.shared.delegate as? AppDelegate
    )?.persistentContainer.viewContext
    
    func updateOrCreateDataContainer(byNew: [Task]) {
        guard let context = appDelegateContainer else {
            return
        }
        
        let currentTasks = TaskModel(context: context)
        
        currentTasks.task = encode(task: byNew)
        do {
            try context.save()
        } catch {
            print("Error - \(error.localizedDescription)")
        }
    }
    
    func delete() {
        guard let context = appDelegateContainer else {
            return
        }
        let deleteFetch = NSFetchRequest<NSFetchRequestResult>(
            entityName: "TaskModel"
        )
        let deleteRequest = NSBatchDeleteRequest(
            fetchRequest: deleteFetch
        )
        do {
            try context.execute(deleteRequest)
            try context.save()
        } catch {
            print ("Error - \(error.localizedDescription)")
        }
    }
    
    func decode(taskAsData: Data) -> [Task] {
        guard let tasks = try? PropertyListDecoder().decode(
            [Task].self, from: taskAsData
        ) else {
            return []
        }
        do {
            return tasks
        }
    }
    
    func encode(task: [Task]) -> Data? {
        guard let taskAsData = try? PropertyListEncoder().encode(
            task
        ) else {
            return nil
        }
        do {
            return taskAsData
        }
    }
    
    private init() {
        
    }
    
}
