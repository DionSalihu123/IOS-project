//
//  RegisterViewController.swift
//  DailyTaskTracker
//
//  Created by Dion Behar Rita
//

import UIKit

class RegisterViewController: UIViewController {

    @IBOutlet weak var newEmailTextField: UITextField!
    @IBOutlet weak var newPasswordTextField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        newPasswordTextField.isSecureTextEntry = true
    }

    @IBAction func registerTapped(_ sender: UIButton) {
        let email = newEmailTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) ?? ""
        let password = newPasswordTextField.text ?? ""

        // Basic validations
        if email.isEmpty || password.isEmpty {
            showAlert(title: "Error", message: "Please fill in all fields.")
            return
        }

        if !isValidEmail(email) {
            showAlert(title: "Error", message: "Please enter a valid email address.")
            return
        }

        // Check if email already exists
        if let savedEmail = UserDefaults.standard.string(forKey: "userEmail"), savedEmail == email {
            showAlert(title: "Error", message: "This email is already registered.")
            return
        }

        // Save to UserDefaults
        UserDefaults.standard.set(email, forKey: "userEmail")
        UserDefaults.standard.set(password, forKey: "userPassword")

        showAlert(title: "Success", message: "Account created. Go back and login.") {
            self.navigationController?.popViewController(animated: true)
        }
    }

    func isValidEmail(_ email: String) -> Bool {
        // Basic regex for email validation
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: email)
    }

    func showAlert(title: String, message: String, completion: (() -> Void)? = nil) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default) { _ in completion?() })
        present(alert, animated: true)
    }
}
