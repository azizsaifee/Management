//
//  SignUpViewController.swift
//  Project Management
//
//  Created by Ayush Bharadwaj on 28/02/23.
//

import UIKit
import CoreData

class SignUpViewController: UIViewController {
   
    
        @IBOutlet weak var nameTextField: UITextField!
        @IBOutlet weak var emailTextField: UITextField!
        @IBOutlet weak var passwordTextField: UITextField!
        @IBOutlet weak var departmentTextField: UITextField!
    
    
        
        @IBAction func signupButtonTapped(_ sender: Any) {
            let name = nameTextField.text ?? ""
            let email = emailTextField.text ?? ""
            let password = passwordTextField.text ?? ""
            let department = departmentTextField.text ?? ""
            if validateFields(){
                saveUser(name: name, email: email, password: password, department: department)
            }
        }
    func validateFields() -> Bool {
        let emailRegex = "[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let nameRegex = "[A-Za-z]+"
        let passwordRegex = "^(?=.*[a-zA-Z])(?=.*\\d)(?=.*[@$!%*?&])[a-zA-Z\\d@$!%*?&]{8,}$"
        let deptRegex = "[A-Za-z]+"
        
        let emailPredicate = NSPredicate(format: "SELF MATCHES %@", emailRegex)
        let namePredicate = NSPredicate(format: "SELF MATCHES %@", nameRegex)
        let passwordPredicate = NSPredicate(format: "SELF MATCHES %@", passwordRegex)
        let deptPredicate = NSPredicate(format: "SELF MATCHES %@", deptRegex)
        
        guard let name = nameTextField.text, namePredicate.evaluate(with: name) else {
            showAlert(title: "Invalid Name", message: "Please enter a valid name (letters only).")
            return false
        }
        
        guard let email = emailTextField.text, emailPredicate.evaluate(with: email) else {
            showAlert(title: "Invalid Email", message: "Please enter a valid email address.")
            return false
        }
    
        guard let password = passwordTextField.text, passwordPredicate.evaluate(with: password) else {
            showAlert(title: "Invalid Password", message: "Please enter a valid password (minimum 8 characters, at least one letter and one number).")
            return false
        }
        
        guard let department = departmentTextField.text, deptPredicate.evaluate(with: department) else {
            showAlert(title: "Invalid Department", message: "Please enter a valid department (letters only).")
            return false
        }
        
        // All fields are valid, store information
        return true
    }

    func showAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
    
    func saveUser(name: String, email: String, password: String, department: String) {
        let context = PersistentStorage.shared.context
        let fetchRequest: NSFetchRequest<UserDetail> = UserDetail.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "email == %@", email)
        do {
            let results = try context.fetch(fetchRequest)
            if results.count > 0 {
                // A user with this email already exists
                // Handle this case as appropriate (e.g. show an error message)
                let alert = UIAlertController(title: "", message: "Already Registered.", preferredStyle: .alert)
               
                let Ok = UIAlertAction(title: "Ok", style: .cancel)
                Ok.setValue(UIColor.red, forKey: "titleTextColor")
                alert.addAction(Ok)
                alert.view.subviews.first?.subviews.first?.subviews.first?.backgroundColor = UIColor.black
                let titleString = NSAttributedString(string: "", attributes: [
                    NSAttributedString.Key.foregroundColor: UIColor.yellow,
                    NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 20)
                ])
                alert.setValue(titleString, forKey: "attributedTitle")
                let messageString = NSAttributedString(string: "Already Registered.", attributes: [
                    NSAttributedString.Key.foregroundColor: UIColor.yellow,
                    NSAttributedString.Key.font: UIFont.systemFont(ofSize: 18)
                ])
                alert.setValue(messageString, forKey: "attributedMessage")

                present(alert, animated: true)
                print("Already a user")
                return
            }
        } catch let error as NSError {
            print("Could not fetch user. \(error), \(error.userInfo)")
            return
        }
        
        let entity = NSEntityDescription.entity(forEntityName: "UserDetail", in: context)!
        let user = UserDetail(entity: entity, insertInto: context)
        user.name = name
        user.email = email
        user.password = password
        user.department = department
        do {
            try context.save()
            let alert = UIAlertController(title: "", message: "Registered Succesfully.", preferredStyle: .alert)
            
            let Ok = UIAlertAction(title: "Ok", style: .cancel){_ in
                self.navigationController?.popViewController(animated: true)
            }
            Ok.setValue(UIColor.red, forKey: "titleTextColor")
            alert.addAction(Ok)
            
            alert.view.subviews.first?.subviews.first?.subviews.first?.backgroundColor = UIColor.black
            let titleString = NSAttributedString(string: "", attributes: [
                NSAttributedString.Key.foregroundColor: UIColor.yellow,
                NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 20)
            ])
            alert.setValue(titleString, forKey: "attributedTitle")
            let messageString = NSAttributedString(string: "Registered Succesfully.", attributes: [
                NSAttributedString.Key.foregroundColor: UIColor.yellow,
                NSAttributedString.Key.font: UIFont.systemFont(ofSize: 18)
            ])
            alert.setValue(messageString, forKey: "attributedMessage")
            
            present(alert, animated: true)
        } catch let error as NSError {
            print("Could not save user. \(error), \(error.userInfo)")
        }
    }

    }


