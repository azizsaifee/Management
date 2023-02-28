//
//  AssistHomeViewController.swift
//  Project Management
//
//  Created by 5Exceptions_Mac1 on 20/02/23.
//
import UIKit

class QuizHomeVC: UIViewController {
    
    // MARK: - Variables
    var nextQuestionTimer: Timer?
    var timer: Timer?
    var remainingTime: TimeInterval = 0.0
    var counter = 20 {
        didSet {
            timerLabel.text = "\(counter)"
            if counter == 0 {
            }
        }
    }


    static var objQuizDataRepository = QuizDataRepository()
    let shape = CAShapeLayer()
    static var countCorrectAnswers = 0
    // used in fetching data.
    var countForIdentifier = 1
    var answer = ""
    
    // MARK: - IBOutlets
    // For question number shown above.
    @IBOutlet weak var lblQuestionNumber: UILabel!
    @IBOutlet weak var questionNumberView: UIView!
    // For question shown.
    @IBOutlet weak var question: UILabel!
    // For options shown.
    @IBOutlet var collectionOfOptionLabels: [UILabel]!

    @IBOutlet weak var dataOption1: UILabel!
    @IBOutlet weak var dataOption2: UILabel!
    @IBOutlet weak var dataOption3: UILabel!
    @IBOutlet weak var dataOption4: UILabel!

    @IBOutlet var collectionOfOptionView: [UIView]!

    @IBOutlet weak var viewOfOption1: UIView!
    @IBOutlet weak var viewOfOption2: UIView!
    @IBOutlet weak var viewOfOption3: UIView!
    @IBOutlet weak var viewOfOption4: UIView!

    // For the timer running below.
    @IBOutlet weak var timerLabel: UILabel!
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var endButton: UIButton!

    
    // MARK: - View Methods
    override func viewDidLoad() {
        super.viewDidLoad()

        // hiding navigation bar and tab bar.
        navigationController?.navigationBar.isHidden = true
        tabBarController?.tabBar.isHidden = true
        // tap on option.
        tapOption()
        startAnimationOnTimer()
        roundedProgressOnTimer()
        loadData()
        fetchData()
        settingColoursOnOptionsToThePreviousState()
        uiChanges()
    }
    
    // MARK: - Required Methods
    func loadData() {

        for question in  questionArray{
            countForIdentifier += 1
            if QuizHomeVC.objQuizDataRepository.get(byIdentifier: Int16(countForIdentifier)) == nil {
                QuizHomeVC.objQuizDataRepository.create(data: question)
            } else {
                if QuizHomeVC.objQuizDataRepository.get(byIdentifier: Int16(countForIdentifier))! != question {
                    _ = QuizHomeVC.objQuizDataRepository.delete(byIdentifier: Int16(countForIdentifier))
                    QuizHomeVC.objQuizDataRepository.create(data: question)

                }
            }
        }
        countForIdentifier = 1
    }
    
    func fetchData(){
        if countForIdentifier <= questionArray.count{
            getAnswer(for: Int16(countForIdentifier))

            let questions = QuizHomeVC.objQuizDataRepository.get(byIdentifier: Int16(countForIdentifier))

            lblQuestionNumber.text = "\(questions!.questionNo)"
            question.text = questions!.question
            dataOption1.text = questions!.option1
            dataOption2.text = questions!.option2
            dataOption3.text = questions!.option3
            dataOption4.text = questions!.option4

        }
        countForIdentifier  += 1
        if countForIdentifier > questionArray.count + 1{
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "QuizResultVC") as! QuizResultVC
            self.navigationController?.pushViewController(vc, animated: true)
            self.countForIdentifier = 1
        }
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
    

    func getAnswer(for questionNumber: Int16) {
        answer = QuizHomeVC.objQuizDataRepository.get(byIdentifier: questionNumber)!.answer
    }
    
    func settingColoursOnOptionsToThePreviousState() {
        dataOption1.backgroundColor = .systemPurple
        dataOption2.backgroundColor = .systemYellow
        dataOption3.backgroundColor = .systemMint
        dataOption4.backgroundColor = .systemBrown
    }
    

    func uiChanges() {
        for option in collectionOfOptionView {
            option.layer.cornerRadius = 20
            option.clipsToBounds = true
        }
        
        questionNumberView.layer.cornerRadius = questionNumberView.bounds.height / 2
        questionNumberView.clipsToBounds = true
        questionNumberView.backgroundColor = .systemIndigo

    }
    
    func checkIsItCorrect() {
        for option in collectionOfOptionLabels {
            if option.text == answer {
                option.backgroundColor = .systemGreen
            } else {
                option.backgroundColor = .systemRed
                option.isUserInteractionEnabled = false
            }
        }
    }
    
    
    
    @objc func buttonTapped(sender: UITapGestureRecognizer) {
        selectedOption = Int(sender.name!)
        checkIsItCorrect()
        switch sender.name {
        case "1":
            DispatchQueue.main.asyncAfter(deadline: .now() + 2){
                self.fetchData()
                self.counter = 20
                self.didTapChange()
                self.original()
            }

            print("option 1 tapped!")
            //timerLabel.isHidden = true
            if dataOption1.text! == answer {
                QuizHomeVC.countCorrectAnswers += 1
            }
            nextQuestionTimer = Timer(timeInterval: 5, repeats: true) { [weak self] nextQuestionTimer in
                print("I am Here!")
            }
        case "2":
            DispatchQueue.main.asyncAfter(deadline: .now() + 2){
                self.fetchData()
                self.counter = 20
                self.didTapChange()
                self.original()
            }

            print("option 2 tapped!")
            if dataOption2.text == answer {
                QuizHomeVC.countCorrectAnswers += 1
            }
        case "3":
            DispatchQueue.main.asyncAfter(deadline: .now() + 2){
                self.fetchData()
                self.counter = 20
                self.didTapChange()
                self.original()
            }

            print("option 3 tapped!")
            if dataOption3.text == answer {
                QuizHomeVC.countCorrectAnswers += 1
            }
        case "4":
            DispatchQueue.main.asyncAfter(deadline: .now() + 2){
                self.fetchData()
                self.counter = 20
                self.didTapChange()
                self.original()
            }
            print("option 4 tapped!")
            if dataOption4.text == answer {
                QuizHomeVC.countCorrectAnswers += 1
            }
        default :
            print("Nil Found!")
        }
    }
    

    @objc func startAnimationOnTimer(){
        let animation = CABasicAnimation(keyPath: "strokeEnd")
        animation.toValue = 1
        animation.duration = 23
        animation.fillMode = .forwards
        animation.isRemovedOnCompletion = false
        shape.add(animation, forKey: "animation")
    }
    

    func roundedProgressOnTimer(){
        let ciclePath = UIBezierPath(arcCenter:timerLabel.center,
                                     radius: 30,
                                     startAngle: -(.pi/2),
                                     endAngle: .pi * 2,
                                     clockwise: true)
        let trackShape = CAShapeLayer()
        trackShape.path = ciclePath.cgPath
        trackShape.fillColor = UIColor.clear.cgColor
        trackShape.lineWidth = 5
        trackShape.strokeColor = UIColor.green.cgColor
        view.layer.addSublayer(trackShape)
        shape.path = ciclePath.cgPath
        shape.lineWidth = 5
        shape.strokeColor = UIColor.lightGray.cgColor
        shape.fillColor = UIColor.clear.cgColor
        shape.strokeEnd = 0
        view.layer.addSublayer(shape)
    }
    

    
    @IBAction func EndBtnAction(_ sender: UIButton){
        let alert = UIAlertController(title: "", message: "Do you really want to quit?", preferredStyle: .alert)
        let ok = UIAlertAction(title: "Ok", style: .default){_ in
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "StartQuizVC") as! StartQuizVC
            self.navigationController?.pushViewController(vc, animated: true)
            self.countForIdentifier = 1
        }
        
        ok.setValue(UIColor.green, forKey: "titleTextColor")
        let cancel = UIAlertAction(title: "Cancel", style: .cancel)
        cancel.setValue(UIColor.red, forKey: "titleTextColor")
        alert.addAction(ok)
        alert.addAction(cancel)
        alert.view.subviews.first?.subviews.first?.subviews.first?.backgroundColor = UIColor.black // set background color
        let titleString = NSAttributedString(string: "", attributes: [
            NSAttributedString.Key.foregroundColor: UIColor.yellow,
            NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 20)
        ])
        alert.setValue(titleString, forKey: "attributedTitle")
        
        // create an attributed string for the message with green color
        let messageString = NSAttributedString(string: "Do you really want to quit?", attributes: [
            NSAttributedString.Key.foregroundColor: UIColor.yellow,
            NSAttributedString.Key.font: UIFont.systemFont(ofSize: 18)
        ])
        alert.setValue(messageString, forKey: "attributedMessage")
        
        present(alert, animated: true)
    }

}
    

