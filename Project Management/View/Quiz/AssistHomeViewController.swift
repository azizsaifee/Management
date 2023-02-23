//
//  AssistHomeViewController.swift
//  Project Management
//
//  Created by 5Exceptions_Mac1 on 20/02/23.
//
import UIKit

class AssistHomeViewController: UIViewController {
    
    // MARK: - Variables
    var timer: Timer?
    var remainingTime: TimeInterval = 0.0
    var counter = 60 {
        didSet {
            timerLabel.text = "\(counter)"
            if counter == 0 {
            }
        }
    }
    static var objRepositorys = AppDataRepositorys()
    var count = 1
    let shape = CAShapeLayer()
    var labelView = UILabel()
    
    // MARK: - IBOutlets
    
    @IBOutlet weak var questionNumberView: UIView!
    
    @IBOutlet var collectionForOptionLabels: [UILabel]!
    @IBOutlet weak var dataOption1: UILabel!
    @IBOutlet weak var dataOption2: UILabel!
    @IBOutlet weak var dataOption3: UILabel!
    @IBOutlet weak var dataOption4: UILabel!
    @IBOutlet var collectionOptionView: [UIView]!
    @IBOutlet weak var viewOfOption1: UIView!
    @IBOutlet weak var viewOfOption2: UIView!
    @IBOutlet weak var viewOfOption3: UIView!
    @IBOutlet weak var viewOfOption4: UIView!
    @IBOutlet weak var lblQuestionNumber: UILabel!

    @IBOutlet weak var timerLabel: UILabel!
    @IBOutlet weak var question: UILabel!
    @IBOutlet weak var nextBtn: UIButton!
    @IBOutlet weak var option1WrongImage: UIImageView!
    @IBOutlet weak var option1RightImage: UIImageView!
    @IBOutlet weak var option2WrongImage: UIImageView!
    @IBOutlet weak var option2RightImage: UIImageView!
    @IBOutlet weak var option3WrongImage: UIImageView!
    @IBOutlet weak var option3RightImage: UIImageView!
    @IBOutlet weak var option4WrongImage: UIImageView!
    @IBOutlet weak var option4RightImage: UIImageView!
    
    // MARK: - View Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.isHidden = true
        cornerRadius()
        tapOption()
        didTapChange()
        roundedprogress()
        loadData()
        fetchData()
        original()
        design()
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
            let vc = storyboard?.instantiateViewController(withIdentifier: "AssistResultViewController") as! AssistResultViewController
            
            self.navigationController?.pushViewController(vc, animated: true)
            
        case 1 :
            count += 1
            getAnswer(for: 1)
            let questionOne = AssistHomeViewController.objRepositorys.get(byIdentifier: 1)
            lblQuestionNumber.text = "\(questionOne!.questionNo)"
            question.text = questionOne!.question
            print(questionOne!.answer)
            dataOption1.text = questionOne!.option1
            dataOption2.text = questionOne!.option2
            dataOption3.text = questionOne!.option3
            dataOption4.text = questionOne!.option4
            
        case 2:
            getAnswer(for: 2)
            count += 1
            let questionTwo = AssistHomeViewController.objRepositorys.get(byIdentifier: 2)
            lblQuestionNumber.text = "\(questionTwo!.questionNo)"
            question.text = questionTwo!.question
            dataOption1.text = questionTwo!.option1
            dataOption2.text = questionTwo!.option2
            dataOption3.text = questionTwo!.option3
            dataOption4.text = questionTwo!.option4
            
        case 3:
            getAnswer(for: 3)
            count += 1
            let questionThree = AssistHomeViewController.objRepositorys.get(byIdentifier: 3)
            lblQuestionNumber.text = "\(questionThree!.questionNo)"
            question.text = questionThree!.question
            dataOption1.text = questionThree!.option1
            dataOption2.text = questionThree!.option2
            dataOption3.text = questionThree!.option3
            dataOption4.text = questionThree!.option4
            
        case 4:
            getAnswer(for: 4)
            count += 1
            let questionFour = AssistHomeViewController.objRepositorys.get(byIdentifier: 4)
            lblQuestionNumber.text = "\(questionFour!.questionNo)"
            question.text = questionFour!.question
            dataOption1.text = questionFour!.option1
            dataOption2.text = questionFour!.option2
            dataOption3.text = questionFour!.option3
            dataOption4.text = questionFour!.option4
            
        case 5:
            getAnswer(for: 5)
            count = 0
            let questionFive = AssistHomeViewController.objRepositorys.get(byIdentifier: 5)
            lblQuestionNumber.text = "\(questionFive!.questionNo)"
            question.text = questionFive!.question
            dataOption1.text = questionFive!.option1
            dataOption2.text = questionFive!.option2
            dataOption3.text = questionFive!.option3
            dataOption4.text = questionFive!.option4
            
        default:
            print("none")
        }
    }
    
    static var countCorrectAnswers = 0
    // Next Button IBAction.
    @IBAction func nextBtnAction(_ sender: Any) {
        fetchData()
        counter = 60
        didTapChange()
        original()
    }
    
    func tapOption() {
        let option1 = UITapGestureRecognizer(target: self, action: #selector(buttonTapped(sender:)))
        option1.name = "1"
        viewOfOption1.addGestureRecognizer(option1)
        
        let option2 = UITapGestureRecognizer(target: self, action: #selector(buttonTapped(sender:)))
        option2.name = "2"
        viewOfOption2.addGestureRecognizer(option2)
        
        let option3 = UITapGestureRecognizer(target: self, action: #selector(buttonTapped(sender:)))
        option3.name = "3"
        viewOfOption3.addGestureRecognizer(option3)
        
        let option4 = UITapGestureRecognizer(target: self, action: #selector(buttonTapped(sender:)))
        option4.name = "4"
        viewOfOption4.addGestureRecognizer(option4)
    }
    
    var answer = ""
    
    func getAnswer(for questionNumber: Int16) {
        answer = AssistHomeViewController.objRepositorys.get(byIdentifier: questionNumber)!.answer
    }
    
    func original() {
        dataOption1.backgroundColor = .systemPurple
        dataOption2.backgroundColor = .systemYellow
        dataOption3.backgroundColor = .systemMint
        dataOption4.backgroundColor = .systemBrown
    }
    
    func design() {
        for option in collectionOptionView {
            option.layer.cornerRadius = 20
            option.clipsToBounds = true
        }
        
        questionNumberView.layer.cornerRadius = questionNumberView.bounds.height / 2
        questionNumberView.clipsToBounds = true
        questionNumberView.backgroundColor = .systemIndigo
        
    }
    
    func checkIsItCorrect() {
//        if dataOption1.text! == answer {
//            dataOption1.backgroundColor = .systemGreen
//        } else {
//            dataOption2.backgroundColor = .systemRed
//            dataOption3.backgroundColor = .systemRed
//            dataOption4.backgroundColor = .systemRed
//        }
//        if dataOption2.text == answer {
//            dataOption2.backgroundColor = .systemGreen
//        } else {
//            dataOption3.backgroundColor = .systemRed
//            dataOption3.backgroundColor = .systemRed
//            dataOption1.backgroundColor = .systemRed
//        }
//
//
//        if dataOption4.text == answer {
//            dataOption4.backgroundColor = .systemGreen
//        } else {
//            dataOption1.backgroundColor = .systemRed
//            dataOption2.backgroundColor = .systemRed
//            dataOption3.backgroundColor = .systemRed
//        }
        for option in collectionForOptionLabels {
            if option.text == answer {
                option.backgroundColor = .systemGreen
            } else {
                option.backgroundColor = .systemRed
                option.isUserInteractionEnabled = false
            }
        }
    }
    
    var selectedOption: Int? = nil
    
    @objc func buttonTapped(sender: UITapGestureRecognizer) {
        selectedOption = Int(sender.name!)
        checkIsItCorrect()
        switch sender.name {
        case "1":
            print("option 1 tapped!")
            timerLabel.isHidden = true
            for view in view.subviews {
                print("ye")
            }
            
            if dataOption1.text! == answer {
                AssistHomeViewController.countCorrectAnswers += 1
            }
        case "2":
            print("option 2 tapped!")
            if dataOption2.text == answer {
                AssistHomeViewController.countCorrectAnswers += 1
            }
        case "3":
            print("option 3 tapped!")
            if dataOption3.text == answer {
                AssistHomeViewController.countCorrectAnswers += 1
            }
        case "4":
            print("option 4 tapped!")
            if dataOption4.text == answer {
                AssistHomeViewController.countCorrectAnswers += 1
            }
        default :
            print("Nil Found!")
        }
    }
    
    @objc func didTapChange(){
        let animation = CABasicAnimation(keyPath: "strokeEnd")
        animation.toValue = 1
        animation.duration = 73
        
        animation.fillMode = .forwards
        animation.isRemovedOnCompletion = false
        shape.add(animation, forKey: "animation")
    }
    
    func roundedprogress(){
        
        let ciclePath = UIBezierPath(arcCenter:timerLabel.center,
                                     radius: 30,
                                     startAngle: -(.pi/2),
                                     endAngle: .pi * 2,
                                     clockwise: true)
        
        let trackShape = CAShapeLayer()
        trackShape.path = ciclePath.cgPath
        trackShape.fillColor = UIColor.clear.cgColor
        trackShape.lineWidth = 5
        trackShape.strokeColor = UIColor.lightGray.cgColor
        view.layer.addSublayer(trackShape)
        
        shape.path = ciclePath.cgPath
        shape.lineWidth = 5
        shape.strokeColor = UIColor.green.cgColor
        shape.fillColor = UIColor.clear.cgColor
        shape.strokeEnd = 0
        
        view.layer.addSublayer(shape)
        
    }
    
    func cornerRadius(){
        
        option1RightImage.layer.masksToBounds = false
        option1RightImage.clipsToBounds = true
        option1RightImage.layer.cornerRadius = option1RightImage.frame.size.width/2
        
        option1WrongImage.layer.masksToBounds = false
        option1WrongImage.clipsToBounds = true
        option1WrongImage.layer.cornerRadius = option1WrongImage.frame.size.width/2
        
        option2RightImage.layer.masksToBounds = false
        option2RightImage.clipsToBounds = true
        option2RightImage.layer.cornerRadius = option2RightImage.frame.size.width/2
        
        option2WrongImage.layer.masksToBounds = false
        option2WrongImage.clipsToBounds = true
        option2WrongImage.layer.cornerRadius = option2WrongImage.frame.size.width/2
        
        option3RightImage.layer.masksToBounds = false
        option3RightImage.clipsToBounds = true
        option3RightImage.layer.cornerRadius = option3RightImage.frame.size.width/2
        
        option3WrongImage.layer.masksToBounds = false
        option3WrongImage.clipsToBounds = true
        option3WrongImage.layer.cornerRadius = option3WrongImage.frame.size.width/2
        
        option4RightImage.layer.masksToBounds = false
        option4RightImage.clipsToBounds = true
        option4RightImage.layer.cornerRadius
        option4RightImage.frame.size.width/2
        
        option4WrongImage.layer.masksToBounds = false
        option4WrongImage.clipsToBounds = true
        option4WrongImage.layer.cornerRadius
        option4WrongImage.frame.size.width/2
        
    }
}
    

