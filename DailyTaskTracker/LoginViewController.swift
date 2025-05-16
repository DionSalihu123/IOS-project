	//
//  LoginViewController.swift
//  DailyTaskTracker
//
//  Created by Dion on 16.5.25.
//


import UIKit

class LoginViewController: UIViewController {

    
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func loginTapped(_ sender: UIButton) {
        let email = emailTextField.text ?? ""
        let password = passwordTextField.text ?? ""

        let savedEmail = UserDefaults.standard.string(forKey: "userEmail")
        let savedPassword = UserDefaults.standard.string(forKey: "userPassword")

        if email == savedEmail && password == savedPassword {
            // Navigate to Task List screen
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            if let taskVC = storyboard.instantiateViewController(withIdentifier: "TaskListViewController") as? TaskListViewController {
                navigationController?.pushViewController(taskVC, animated: true)
            }
        } else {
            // Show error alert
            let alert = UIAlertController(title: "Error", message: "Invalid credentials", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default))
            present(alert, animated: true)
        }
    }

   
    @IBAction func goToRegisterTapped(_ sender: UIButton) {
    // Navigate to Register screen
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if let registerVC = storyboard.instantiateViewController(withIdentifier: "RegisterViewController") as? RegisterViewController {
            navigationController?.pushViewController(registerVC, animated: true)
        }
    }
}
