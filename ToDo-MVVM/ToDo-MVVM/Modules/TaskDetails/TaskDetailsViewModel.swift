//
//  TaskDetailsViewModel.swift
//  ToDo-MVVM
//
//  Created by Kazakov Danil on 07.02.2023.
//


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
    
    func getTask(task: Task, newDescription: String) {
        let task = Task(
            description: newDescription,
            deadLine: task.deadLine,
            completionStatus: task.completionStatus,
            number: task.number
        )
        delegate?.updateTask(task: task)
    }
    
    
}
    
    
    


