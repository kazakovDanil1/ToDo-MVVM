//
//  AppDelegate.swift
//  TestTaskForCFT
//
//  Created by Kazakov Danil on 01.02.2023.
//

import UIKit
import CoreData

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "TaskModel")
        container.loadPersistentStores { (storeDescription, error) in
            if let error = error as? NSError {
                fatalError()
            }
        }
        return container
    }()
    
    func saveContext() {
        let context = persistentContainer.viewContext
        
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                
                let nsError = error as NSError
                
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
                
            }
        }
    }
}

func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [
        UIApplication.LaunchOptionsKey: Any
    ]?) -> Bool {
    
    return true
}

// MARK: UISceneSession Lifecycle
func application(
    _ application: UIApplication,
    configurationForConnecting connectingSceneSession: UISceneSession,
    options: UIScene.ConnectionOptions
) -> UISceneConfiguration {
    
    return UISceneConfiguration(
        name: "Default Configuration",
        sessionRole: connectingSceneSession.role
    )
}



