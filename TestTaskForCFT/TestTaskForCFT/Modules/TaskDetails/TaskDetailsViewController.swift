//
//  TaskDetailsViewController.swift
//  TestTaskForCFT
//
//  Created by Kazakov Danil on 01.02.2023.
//

import UIKit

class TaskDetailsViewController: UIViewController {
    
    let contentView = TaskDetailsView()
    
    override func loadView() {
        self.view = TaskDetailsView(frame: UIScreen.main.bounds)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

}
