//
//  RegisterViewController.swift
//  DailyTaskTracker
//
//  Created by Dion on 16.5.25.
//

import UIKit

class RegisterViewController: UIViewController {

    @IBOutlet weak var newEmailTextField: UITextField!
    
    
    @IBOutlet weak var newPasswordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func registerTapped(_ sender: UIButton) {
        let email = newEmailTextField.text ?? ""
        let password = newPasswordTextField.text ?? ""

        // Save to UserDefaults
        UserDefaults.standard.set(email, forKey: "userEmail")
        UserDefaults.standard.set(password, forKey: "userPassword")

        let alert = UIAlertController(title: "Success", message: "Account created. Go back and login.", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default) { _ in
            self.navigationController?.popViewController(animated: true)
        })
        present(alert, animated: true)
    }
}
