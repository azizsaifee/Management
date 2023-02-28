//
//  AssistResultViewController.swift
//  Project Management
//
//  Created by 5Exceptions_Mac1 on 20/02/23.
//

import UIKit

class QuizResultVC: UIViewController {
    @IBOutlet weak var correctAnswerLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        correctAnswerLabel.text = "\(QuizHomeVC.countCorrectAnswers) / \(questionArray.count)"
    }
    

    @IBAction func backBtn(_ sender: Any) {
       // self.navigationController?.popToRootViewController(animated: true)
        let vc = storyboard?.instantiateViewController(withIdentifier: "StartAssistViewController")
        as! StartQuizVC
        vc.tabBarController?.tabBar.isHidden = false
        self.navigationController?.pushViewController(vc, animated: true)
        QuizHomeVC.countCorrectAnswers = 0
    }
    

}
