//
//  AssistResultViewController.swift
//  Project Management
//
//  Created by 5Exceptions_Mac1 on 20/02/23.
//

import UIKit

class AssistResultViewController: UIViewController {
    @IBOutlet weak var correctAnswerLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        correctAnswerLabel.text = "\(AssistHomeViewController.countCorrectAnswers)"
    }
    

    @IBAction func backBtn(_ sender: Any) {
        self.navigationController?.popToRootViewController(animated: true)
    }
    

}
