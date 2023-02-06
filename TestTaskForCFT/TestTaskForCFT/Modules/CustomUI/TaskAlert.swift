//
//  TaskAlert.swift
//  TestTaskForCFT
//
//  Created by Kazakov Danil on 04.02.2023.
//

import UIKit

class TaskAlert {
    struct Constants {
        static let backgroundAlpha: CGFloat = 0.6
    }
    
    private var myTargetView: UIView?
    private var myTarget: CustomViewField?
    
    var taskClosure: ((String) -> ())? = nil
    
    //MARK: ALERT - ELEMENTS
    private let backgroundImage: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .none
        imageView.image = UIImage(systemName: "app.fill")
        
        return imageView
    }()
    
    private let alertView: UIView = {
        let view = UIView()
        view.backgroundColor = .none
        
        return view
    }()
    
    private let backgroundView: UIView = {
        let view = UIView()
        view.backgroundColor = .black
        view.alpha = 0
        
        return view
    }()
    
    
    //MARK: - ALERT FUNCTION
    func showAlert(
        title: String,
        message: String,
        controller: UIViewController
    ) {
        guard let targetView = controller.view
        else {
            print("can't pass")
            return
        }
        
        myTargetView = targetView
        
        backgroundView.frame = targetView.bounds
        targetView.addSubview(backgroundView)
        
        alertView.frame = CGRect(
            x: 40,
            y: -300,
            width: targetView.frame.width - 40,
            height: 300
        )
        targetView.addSubview(alertView)
        
        backgroundImage.frame = CGRect(
            x: 0,
            y: -65,
            width: alertView.frame.size.width,
            height: alertView.frame.size.height
        )
        alertView.addSubview(backgroundImage)
        
        let titleLabel = createTitleLabel(
            x: 0,
            y: Int(backgroundImage.bounds.minY - 30),
            width: Int(alertView.frame.size.width),
            height: 80
        )
        
        let taskField = CustomViewField(
            frame: CGRect(
                x: titleLabel.frame.maxY,
                y: titleLabel.frame.midX - 140,
                width: backgroundImage.bounds.size.width - 100,
                height: backgroundImage.frame.height / 3
            )
        )
        
        let buttonAlert = createButton(
            x: 0,
            y: Int(taskField.frame.maxY),
            width: Int(backgroundImage.bounds.width),
            height: 100
        )
        
        alertView.addSubview(titleLabel)
        alertView.addSubview(taskField)
        alertView.addSubview(buttonAlert)
        
        
        myTarget = taskField
        
        UIView.animate(withDuration: 0.2, animations: {
            self.backgroundView.alpha = Constants.backgroundAlpha
        }, completion: { done in
            if done {
                UIView.animate(withDuration: 0.2, animations: {
                    self.alertView.center = targetView.center
                })
            }
        })
        
    }
    
    //MARK: - CREATE ALERT UI
    func createTitleLabel(
        x: Int,
        y: Int,
        width: Int,
        height: Int
    ) -> UILabel {
        let titleLabel = UILabel(
            frame: CGRect(
                x: x,
                y: y,
                width: width,
                height: height
            )
        )
        
        titleLabel.text = "new task"
        titleLabel.font = .systemFont(ofSize: 30)
        titleLabel.textColor = .black
        titleLabel.textAlignment = .center
        
        return titleLabel
    }
    
    func createButton(
        x: Int,
        y: Int,
        width: Int,
        height: Int
    ) -> UIButton {
        
        let buttonAlert = UIButton(
            frame: CGRect(
                x: x,
                y: y,
                width: width,
                height: height
            )
        )
        
        guard let arrow = UIImage(
            systemName: "arrow.down.circle.fill"
        ) else {
            return UIButton()
        }
        
        buttonAlert.setImage(
            arrow, for: .normal
        )
        
        buttonAlert.addTarget(
            self,
            action: #selector(createTask),
            for: .touchUpInside
        )
        buttonAlert.tintColor = .black
        
        return buttonAlert
    }
    
    @objc func createTask() {
        guard let myTarget = myTarget else { return }
        taskClosure?(myTarget.text)
    }

    func create(completion: @escaping((String) -> ())) {
        taskClosure = { text in
            completion(text)
        }
    }
    
    //MARK: ALERT DISMISS
    @objc func dismissAlert() {
        guard let targetView = myTargetView else { return }
        
        UIView.animate(withDuration: 0.3, animations: {
            self.alertView.frame = CGRect(
                x: 40,
                y: targetView.frame.size.height + 300,
                width: targetView.frame.size.width - 80,
                height: 300
            )
        }, completion: { done in
            if done {
                UIView.animate(withDuration: 0.3, animations: {
                    self.backgroundView.alpha = 0
                }, completion: { done in
                    if done {
                        self.alertView.removeFromSuperview()
                        self.backgroundView.removeFromSuperview()
                        self.backgroundImage.removeFromSuperview()
                        
                    }
                })
            }
        })
    }
    
}
