//
//  AssistHomeViewController.swift
//  Project Management
//
//  Created by 5Exceptions_Mac1 on 20/02/23.
//

import UIKit

class AssistHomeViewController: UIViewController {
    
    // MARK: - Variables
    var arrayOfAnswers: [String]  = ["a : Bit","b: Central Processing Unit","c : Central Processing Unit", "a : Optional","a : let, var"]
    var timer: Timer?
    var remainingTime: TimeInterval = 0.0
    var counter = 0 {
        didSet {
            timerLabel.text = "\(counter)"
            if counter == 60 {
                timerLabel.text = "Times Up!"
            }
        }
    }
    static var objRepositorys = AppDataRepositorys()
    var count = 1
    
    // MARK: - IBOutlets
    @IBOutlet weak var timerLabel: UILabel!
    @IBOutlet weak var option1Btn: UIButton!
    @IBOutlet weak var question: UILabel!
    @IBOutlet weak var questionNumber: UILabel!
    @IBOutlet weak var option2Btn: UIButton!
    @IBOutlet weak var option3Btn: UIButton!
    @IBOutlet weak var option4Btn: UIButton!
    @IBOutlet weak var nextBtn: UIButton!
    @IBOutlet var options: [UIButton]!
    
    // MARK: - View Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.isHidden = true
        loadData()
        fetchData()
    }
    
    // MARK: - Required Methods
    func loadData() {
        if AssistHomeViewController.objRepositorys.get(byIdentifier: 1) == nil {
            AssistHomeViewController.objRepositorys.create(data: question1)
        } else {
            if AssistHomeViewController.objRepositorys.get(byIdentifier: 1)! != question1 {
                _ = AssistHomeViewController.objRepositorys.delete(byIdentifier: 1)
                AssistHomeViewController.objRepositorys.create(data: question1)
            }
        }
        if AssistHomeViewController.objRepositorys.get(byIdentifier: 2) == nil {
            AssistHomeViewController.objRepositorys.create(data: question2)
        } else {
            if AssistHomeViewController.objRepositorys.get(byIdentifier: 2)! != question2 {
                _ = AssistHomeViewController.objRepositorys.delete(byIdentifier: 2)
                AssistHomeViewController.objRepositorys.create(data: question2)
            }
        }
        if AssistHomeViewController.objRepositorys.get(byIdentifier: 3) == nil {
            AssistHomeViewController.objRepositorys.create(data: question3)
        } else {
            if AssistHomeViewController.objRepositorys.get(byIdentifier: 3)! != question3 {
                _ = AssistHomeViewController.objRepositorys.delete(byIdentifier: 3)
                AssistHomeViewController.objRepositorys.create(data: question3)
            }
        }
        if AssistHomeViewController.objRepositorys.get(byIdentifier: 4) == nil {
            AssistHomeViewController.objRepositorys.create(data: question4)
        } else {
            if AssistHomeViewController.objRepositorys.get(byIdentifier: 4)! != question4 {
                _ = AssistHomeViewController.objRepositorys.delete(byIdentifier: 4)
                AssistHomeViewController.objRepositorys.create(data: question4)
            }
        }
        if AssistHomeViewController.objRepositorys.get(byIdentifier: 5) == nil {
            AssistHomeViewController.objRepositorys.create(data: question5)
        } else {
            if AssistHomeViewController.objRepositorys.get(byIdentifier: 5)! != question5 {
                _ = AssistHomeViewController.objRepositorys.delete(byIdentifier: 5)
                AssistHomeViewController.objRepositorys.create(data: question5)
            }
        }
    }
    
    func fetchData(){
        switch count {
        case 0 :
            checkForAnswer(of: 5)
            
            let vc = storyboard?.instantiateViewController(withIdentifier: "AssistResultViewController") as! AssistResultViewController
            
            self.navigationController?.pushViewController(vc, animated: true)
        case 1 :
            count += 1
            let one = AssistHomeViewController.objRepositorys.get(byIdentifier: 1)
            questionNumber.text = "\(one!.questionNo)"
            question.text = one!.question
            print(one!.answer)
            btnenabled()
            option1Btn.setTitle(one!.option1, for: .normal)
            option2Btn.setTitle(one!.option2, for: .normal)
            option3Btn.setTitle(one!.option3, for: .normal)
            option4Btn.setTitle(one!.option4, for: .normal)
        case 2:
            checkForAnswer(of: 1)
            count += 1
            let two = AssistHomeViewController.objRepositorys.get(byIdentifier: 2)
            questionNumber.text = "\(two!.questionNo)"
            question.text = two!.question
            btnenabled()
            option1Btn.setTitle(two!.option1, for: .normal)
            option2Btn.setTitle(two!.option2, for: .normal)
            option3Btn.setTitle(two!.option3, for: .normal)
            option4Btn.setTitle(two!.option4, for: .normal)
            
        case 3:
            checkForAnswer(of: 2)
            count += 1
            let three = AssistHomeViewController.objRepositorys.get(byIdentifier: 3)
            questionNumber.text = "\(three!.questionNo)"
            question.text = three!.question
            btnenabled()
            option1Btn.setTitle(three!.option1, for: .normal)
            option2Btn.setTitle(three!.option2, for: .normal)
            option3Btn.setTitle(three!.option3, for: .normal)
            option4Btn.setTitle(three!.option4, for: .normal)
            
        case 4:
            checkForAnswer(of: 3)
            count += 1
            let four = AssistHomeViewController.objRepositorys.get(byIdentifier: 4)
            questionNumber.text = "\(four!.questionNo)"
            question.text = four!.question
            btnenabled()
            option1Btn.setTitle(four!.option1, for: .normal)
            option2Btn.setTitle(four!.option2, for: .normal)
            option3Btn.setTitle(four!.option3, for: .normal)
            option4Btn.setTitle(four!.option4, for: .normal)
            
        case 5:
            checkForAnswer(of: 4)
            count = 0
            let five = AssistHomeViewController.objRepositorys.get(byIdentifier: 5)
            questionNumber.text = "\(five!.questionNo)"
            question.text = five!.question
            btnenabled()
            option1Btn.setTitle(five!.option1, for: .normal)
            option2Btn.setTitle(five!.option2, for: .normal)
            option3Btn.setTitle(five!.option3, for: .normal)
            option4Btn.setTitle(five!.option4, for: .normal)
        default:
            print("none")
        }
    }
    static var countCorrectAnswers = 0
    func checkForAnswer(of questionNumber: Int) {
        for option in options {
            if option.tintColor == .green {
                option.tintColor = .systemBlue
                for check in arrayOfAnswers {
                    //                    if "\(questionNumber)" == this {
                    //                        print("checking")
                    if option.currentTitle == check {
                        print("this is correct")
                        AssistHomeViewController.countCorrectAnswers += 1
                    } else {
                        print("this is incorrect")
                        // QuestionViewController.countCorrectAnswers += 1
                        //}
                    }
                }
            }
        }
    }
    
    @IBAction func nextBtnAction(_ sender: Any) {
        fetchData()
        counter = 0
    }
    
    
    @IBAction func option1(_ sender: Any) {
        if option1Btn.tintColor == .green {
            option1Btn.tintColor = .systemBlue
            option2Btn.isEnabled = true
            option3Btn.isEnabled = true
            option4Btn.isEnabled = true
        } else {
            option1Btn.tintColor = .green
            option2Btn.isEnabled = false
            option3Btn.isEnabled = false
            option4Btn.isEnabled = false
        }
        
    }
    
    
    @IBAction func option2(_ sender: Any) {
        
        if option2Btn.tintColor == .green {
            option2Btn.tintColor = .systemBlue
            option1Btn.isEnabled = true
            option3Btn.isEnabled = true
            option4Btn.isEnabled = true
        } else {
            option2Btn.tintColor = .green
            option1Btn.isEnabled = false
            option3Btn.isEnabled = false
            option4Btn.isEnabled = false
        }
    }
    
    @IBAction func option3(_ sender: Any) {
        if option3Btn.tintColor ==  .green {
            option3Btn.tintColor = .systemBlue
            option1Btn.isEnabled = true
            option2Btn.isEnabled = true
            option4Btn.isEnabled = true
        } else {
            option3Btn.tintColor = .green
            option1Btn.isEnabled = false
            option2Btn.isEnabled = false
            option4Btn.isEnabled = false
        }
    }
    
    
    @IBAction func option4(_ sender: Any) {
        if option4Btn.tintColor == .green {
            option4Btn.tintColor = .systemBlue
            option1Btn.isEnabled = true
            option3Btn.isEnabled = true
            option2Btn.isEnabled = true
        } else {
            option4Btn.tintColor = .green
            option1Btn.isEnabled = false
            option3Btn.isEnabled = false
            option2Btn.isEnabled = false
        }
    }
    
    func btnenabled(){
        option1Btn.isEnabled = true
        option2Btn.isEnabled = true
        option3Btn.isEnabled = true
        option4Btn.isEnabled = true
    }
    
    
}
