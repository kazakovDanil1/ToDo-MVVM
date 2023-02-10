//
//  TaskDetailsViewModel.swift
//  ToDo-MVVM
//
//  Created by Kazakov Danil on 07.02.2023.
//


import Foundation
import UIKit.UIImage

protocol TaskDetailsViewModelDelegate: AnyObject {
    func updateTask(task: Task)
}

class TaskDetailsViewModel {
    
    private let taskViewModel = TasksViewModel()
    
    weak var delegate: TaskDetailsViewModelDelegate?
    
    var task: Task? = nil
    
    var grabTask: ((Task) -> ())? = nil
    
    init(grabTask: ((Task) -> Void)? = nil) {
        self.grabTask = grabTask
    }
    
    func getTask(task: Task, newDescription: String, photo: UIImage?) {
        DispatchQueue.main.async { [weak self] in
            let task = Task(
                description: newDescription,
                deadLine: task.deadLine,
                completionStatus: task.completionStatus,
                number: task.number,
                photo: self?.encode(photo: photo, taskNumber: "\(task.number)")
            )
            self?.delegate?.updateTask(task: task)
        }
    }
    
    func encode(photo: UIImage?, taskNumber: String) -> Data? {
        
        guard let data = photo?.pngData() else { return nil }
        
        DispatchQueue.main.async {
            UserDefaults.standard.set(data, forKey: "\(taskNumber)")
            
            print("it's decoded \(data) for task \(taskNumber)")
        }
        
        return data
    }
    
    func updateImage(image: UIImage?) -> Data? {
        guard let image = image else { return nil }
        guard let data = image.pngData() else { return nil }
        
        return data
    }
    
    
}





