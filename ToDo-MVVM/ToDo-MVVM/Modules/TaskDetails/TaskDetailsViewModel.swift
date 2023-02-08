//
//  TaskDetailsViewModel.swift
//  ToDo-MVVM
//
//  Created by Kazakov Danil on 07.02.2023.
//

class TaskDetailsViewModel {
    
    private let taskViewModel = TasksViewModel()
    
    var task: Task? = nil
    
    var grabTask: ((Task) -> ())? = nil
    
    init(grabTask: ((Task) -> Void)? = nil) {
        self.grabTask = grabTask
    }
    
}
    
    
    


