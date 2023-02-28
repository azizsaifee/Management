//
//  LoginViewController.swift
//  Project Management
//
//  Created by Ayush Bharadwaj on 27/02/23.
//

import UIKit


class LoginViewController: UIViewController {
    
    
    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        //        self.dismissKeyboard()
    }
    
    
    @IBAction func btnLoginClicked(_ sender: UIButton) {
        ValidationCode()
    }
    
//    @IBAction func btnSignupClicked(_ sender: UIButton) {
//        if let signupVC = self.storyboard?.instantiateViewController(identifier: "SignupViewController") as? SignupViewController{
//            self.navigationController?.pushViewController(signupVC, animated: true)
//        }
//    }
    
}



extension LoginViewController{
    fileprivate func ValidationCode() {
        if let email = txtEmail.text, let password = txtPassword.text{
            if !email.validateEmailId(){
                openAlert(title: "Alert", message: "Email address not found.", alertStyle: .alert, actionTitles: ["Okay"], actionStyles: [.default], actions: [{ _ in
                    print("Okay clicked!")
                }])
            }else if !password.validatePassword(){
                openAlert(title: "Alert", message: "Please enter valid password", alertStyle: .alert, actionTitles: ["Okay"], actionStyles: [.default], actions: [{ _ in
                    print("Okay clicked!")
                }])
            }else{
                //Navigation - Home Screen
                guard let username = txtEmail.text, let password = txtPassword.text else {
                    // Handle error: username or password is nil
                    return
                }
                
                // Validate the login credentials
                if isValidLogin(username: username, password: password) {
                    if let tabBar = self.storyboard?.instantiateViewController(withIdentifier: "tabBarVC") {
                        tabBar.modalPresentationStyle = .fullScreen
                        self.navigationController?.present(tabBar, animated: true)
                    }
                    
                }
            }
        }else{
            openAlert(title: "Alert", message: "Please add detail.", alertStyle: .alert, actionTitles: ["Okay"], actionStyles: [.default], actions: [{ _ in
                print("Okay clicked!")
            }])
        }
    }
    
    
    func isValidLogin(username: String, password: String) -> Bool {
        // Perform the validation on the server or in your app logic
        // Return true if the login credentials are valid, false otherwise
        return username == "Ayush@gmail.com" || username == "Aziz@gmail.com" || username == "Ankit@gmail.com" && password == "password123"
    }
}
