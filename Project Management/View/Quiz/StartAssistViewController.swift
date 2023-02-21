//
//  StartAssistViewController.swift
//  Project Management
//
//  Created by 5Exceptions_Mac1 on 20/02/23.
//

import UIKit

class StartAssistViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func start(_ sender: UIButton) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "AssistHomeViewController") as! AssistHomeViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
