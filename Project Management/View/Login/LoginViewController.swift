//
//  LoginViewController.swift
//  Project Management
//
//  Created by Ayush Bharadwaj on 27/02/23.
//

import UIKit
import CoreData

class LoginViewController: UIViewController{
    
    
    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func btnLoginClicked(_ sender: UIButton) {
        let email = txtEmail.text ?? ""
        let password = txtPassword.text ?? ""
        let user = fetchUser(email: email, password: password)
        if user != nil {
            // Handle successful login
            if let tabBar = self.storyboard?.instantiateViewController(withIdentifier: "tabBarVC") {
                tabBar.modalPresentationStyle = .fullScreen
                self.navigationController?.present(tabBar, animated: true)
            }
            
        }
            else {
                // Handle failed login
                let alert = UIAlertController(title: "", message: "Wrong Credentials", preferredStyle: .alert)
               
                let Ok = UIAlertAction(title: "Ok", style: .cancel)
                Ok.setValue(UIColor.red, forKey: "titleTextColor")
                alert.addAction(Ok)
                alert.view.subviews.first?.subviews.first?.subviews.first?.backgroundColor = UIColor.black
                let titleString = NSAttributedString(string: "", attributes: [
                    NSAttributedString.Key.foregroundColor: UIColor.yellow,
                    NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 20)
                ])
                alert.setValue(titleString, forKey: "attributedTitle")
                let messageString = NSAttributedString(string: "Wrong Credentials", attributes: [
                    NSAttributedString.Key.foregroundColor: UIColor.yellow,
                    NSAttributedString.Key.font: UIFont.systemFont(ofSize: 18)
                ])
                alert.setValue(messageString, forKey: "attributedMessage")

                present(alert, animated: true)
                
            }
        }
        
        func fetchUser(email: String, password: String) -> UserDetail? {
            let context = PersistentStorage.shared.context
            let fetchRequest: NSFetchRequest<UserDetail> = UserDetail.fetchRequest()
            fetchRequest.predicate = NSPredicate(format: "email == %@ AND password == %@", email, password)
            do {
                let results = try context.fetch(fetchRequest)
                return results.first
            } catch let error as NSError {
                print("Could not fetch user. \(error), \(error.userInfo)")
                return nil
            }
        }
    
    
    @IBAction func btnSignupClicked(_ sender: UIButton) {
        if let signupVC = self.storyboard?.instantiateViewController(identifier: "SignUpViewController") as? SignUpViewController{
            self.navigationController?.pushViewController(signupVC, animated: true)
        }
    }
    @IBAction func forgotPasswordTapped(_ sender: Any) {
        let alertController = UIAlertController(title: "Forgot Password", message: "Enter your email address", preferredStyle: .alert)
        alertController.addTextField { (textField) in
            textField.placeholder = "Email"
        }
        let Cancel = UIAlertAction(title: "Cancel", style: .cancel)
        Cancel.setValue(UIColor.red, forKey: "titleTextColor")
        alertController.addAction(Cancel)
        let Reset = UIAlertAction(title: "Reset Password", style: .default,handler: { (action) in
                                      if let email = alertController.textFields?.first?.text {
                                          self.resetPassword(email: email)
                                      }
                                  })
        Reset.setValue(UIColor.yellow, forKey: "titleTextColor")
        alertController.addAction(Reset)
      
        alertController.view.subviews.first?.subviews.first?.subviews.first?.backgroundColor = UIColor.black
        let titleString = NSAttributedString(string: "Forgot Password", attributes: [
            NSAttributedString.Key.foregroundColor: UIColor.yellow,
            NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 20)
        ])
        alertController.setValue(titleString, forKey: "attributedTitle")
        let messageString = NSAttributedString(string: "Enter your email address", attributes: [
            NSAttributedString.Key.foregroundColor: UIColor.yellow,
            NSAttributedString.Key.font: UIFont.systemFont(ofSize: 18)
        ])
        alertController.setValue(messageString, forKey: "attributedMessage")
        
        present(alertController, animated: true, completion: nil)
    }

    func resetPassword(email: String) {
        // Check if user with email exists
        let context = PersistentStorage.shared.context
        let fetchRequest: NSFetchRequest<UserDetail> = UserDetail.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "email == %@", email)
        do {
            let results = try context.fetch(fetchRequest)
            guard let user = results.first else {
                // User not found
                // Handle this case as appropriate (e.g. show an error message)
                return
            }

            // Prompt user to enter new password
            let alertController = UIAlertController(title: "Reset Password", message: "Enter a new password", preferredStyle: .alert)
            alertController.addTextField { (textField) in
                textField.placeholder = "New Password"
                textField.isSecureTextEntry = true
            }
            let Cancel = UIAlertAction(title: "Cancel", style: .cancel)
            Cancel.setValue(UIColor.red, forKey: "titleTextColor")
            alertController.addAction(Cancel)
            let Reset = UIAlertAction(title: "Reset Password", style: .default, handler: { (action) in
                if let newPassword = alertController.textFields?.first?.text {
                    user.password = newPassword
                    try? context.save()
                    // Show alert to confirm password reset
                    let alert = UIAlertController(title: "Password Reset", message: "Your password has been reset", preferredStyle: .alert)
                    let Cancel = UIAlertAction(title: "Ok", style: .default)
                    Cancel.setValue(UIColor.red, forKey: "titleTextColor")
                    alert.addAction(Cancel)
                    //alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                    alert.view.subviews.first?.subviews.first?.subviews.first?.backgroundColor = UIColor.black
                    let titleString = NSAttributedString(string: "Password Reset", attributes: [
                        NSAttributedString.Key.foregroundColor: UIColor.yellow,
                        NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 20)
                    ])
                    alert.setValue(titleString, forKey: "attributedTitle")
                    let messageString = NSAttributedString(string:  "Your password has been reset", attributes: [
                        NSAttributedString.Key.foregroundColor: UIColor.yellow,
                        NSAttributedString.Key.font: UIFont.systemFont(ofSize: 18)
                    ])
                    alert.setValue(messageString, forKey: "attributedMessage")
                    self.present(alert, animated: true, completion: nil)
                }
            })
            Reset.setValue(UIColor.yellow, forKey: "titleTextColor")
            alertController.addAction(Reset)
            alertController.view.subviews.first?.subviews.first?.subviews.first?.backgroundColor = UIColor.black
            let titleString = NSAttributedString(string: "Reset Password", attributes: [
                NSAttributedString.Key.foregroundColor: UIColor.yellow,
                NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 20)
            ])
            alertController.setValue(titleString, forKey: "attributedTitle")
            let messageString = NSAttributedString(string: "Enter a new password", attributes: [
                NSAttributedString.Key.foregroundColor: UIColor.yellow,
                NSAttributedString.Key.font: UIFont.systemFont(ofSize: 18)
            ])
            alertController.setValue(messageString, forKey: "attributedMessage")

            present(alertController, animated: true, completion: nil)
        } catch let error as NSError {
            print("Could not fetch user. \(error), \(error.userInfo)")
            // Handle error as appropriate
        }
    }
//    

}


