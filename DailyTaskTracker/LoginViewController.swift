	//
//  LoginViewController.swift
//  DailyTaskTracker
//
//  Created by Dion Behar Rita
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        passwordTextField.isSecureTextEntry = true
    }

    @IBAction func loginTapped(_ sender: UIButton) {
        let email = emailTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) ?? ""
        let password = passwordTextField.text ?? ""

        if email.isEmpty || password.isEmpty {
            showAlert(title: "Error", message: "Please fill in all fields.")
            return
        }

        let savedEmail = UserDefaults.standard.string(forKey: "userEmail")
        let savedPassword = UserDefaults.standard.string(forKey: "userPassword")

        if email == savedEmail && password == savedPassword {
            // Navigate to Task List screen
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            if let taskVC = storyboard.instantiateViewController(withIdentifier: "TaskListViewController") as? TaskListViewController {
                navigationController?.pushViewController(taskVC, animated: true)
            }
        } else {
            showAlert(title: "Error", message: "Invalid credentials.")
        }
    }

    @IBAction func goToRegisterTapped(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if let registerVC = storyboard.instantiateViewController(withIdentifier: "RegisterViewController") as? RegisterViewController {
            navigationController?.pushViewController(registerVC, animated: true)
        }
    }

    func showAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        present(alert, animated: true)
    }
}
