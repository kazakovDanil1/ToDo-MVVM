//
//  ToDoTask+CoreDataProperties.swift
//  ToDo-MVVM
//
//  Created by Kazakov Danil on 10.02.2023.
//
//

import Foundation
import CoreData


extension TaskModel {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<TaskModel> {
        return NSFetchRequest<TaskModel>(entityName: "TaskModel")
    }

    @NSManaged public var task: Data?

}

extension TaskModel : Identifiable {

}
