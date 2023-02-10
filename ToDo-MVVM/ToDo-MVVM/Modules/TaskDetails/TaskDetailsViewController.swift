//
//  TaskDetailsViewController.swift
//  ToDo-MVVM
//
//  Created by Kazakov Danil on 07.02.2023.
//

import UIKit

class TaskDetailsViewController: UIViewController {
    
    private let imagePickerController = UIImagePickerController()
    
    lazy var contentView = self.view as? TaskDetailsView
    
    let viewModel = TaskDetailsViewModel()
    
    override func loadView() {
        self.view = TaskDetailsView(frame: UIScreen.main.bounds)
    }
    
    override func viewDidLoad() {
        addTargetToButtons()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        fillContentView()
    }
    
    @objc func updateTask() {
        guard let task = viewModel.task else {
            return
        }
        DispatchQueue.main.async { [weak self] in
            self?.viewModel.getTask(
                task: task,
                newDescription: self?.contentView?.taskView.text ?? "nil",
                photo: self?.contentView?.addImage.screenShotImage.image
            )
        }
        navigationController?.popViewController(animated: true)
    }
    
    @objc func addImage() {
        imagePickerController.allowsEditing = true
        imagePickerController.delegate = self
        imagePickerController.sourceType = .photoLibrary
        self.present(imagePickerController, animated: true)
    }
    
    func fillContentView() {
        DispatchQueue.main.async { [weak self] in
            self?.contentView?.taskLabel.text = self?.viewModel.task?.deadLine
            self?.contentView?.taskView.text = self?.viewModel.task?.description
            
            if let photoData = self?.viewModel.task?.photo {
                self?.contentView?.addImage.screenShotImage.image = UIImage(data: photoData)
            }
        }
    }
}

extension TaskDetailsViewController:
    UINavigationControllerDelegate,
    UIImagePickerControllerDelegate {
    
    func imagePickerController(
        _ picker: UIImagePickerController,
        didFinishPickingMediaWithInfo info: [
            UIImagePickerController.InfoKey : Any
        ]) {
            picker.dismiss(animated: true)
            
            guard let image = info [
                UIImagePickerController.InfoKey.editedImage
            ] as? UIImage else {
                return
            }
            DispatchQueue.main.async { [weak self] in
                self?.contentView?.addImage.screenShotImage.image = image
            }
            dismiss(animated: true)
    }
    
    func addTargetToButtons() {
        contentView?.button.addTarget(
            nil,
            action: #selector(updateTask),
            for: .touchUpInside
        )
        
        let tapRecognizer = UITapGestureRecognizer(
            target: self, action: #selector(addImage)
        )
        
        contentView?.addGestureRecognizer(tapRecognizer)
    }
}


