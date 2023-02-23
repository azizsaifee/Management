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
    
    // MARK: - IBOutlets
    
    
    
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
    
    
    
    @IBOutlet weak var timerLabel: UILabel!
    @IBOutlet weak var option1Btn: UIButton!
    @IBOutlet weak var question: UILabel!
    @IBOutlet weak var questionNumber: UILabel!
    @IBOutlet weak var option2Btn: UIButton!
    @IBOutlet weak var option3Btn: UIButton!
    @IBOutlet weak var option4Btn: UIButton!
    @IBOutlet weak var nextBtn: UIButton!
    @IBOutlet var options: [UIButton]!
    
    @IBOutlet weak var option2view: UIView!
    @IBOutlet weak var option4view: UIView!
    @IBOutlet weak var option3view: UIView!
    @IBOutlet weak var option1View: UIView!
    
    //   @IBOutlet weak var questionlabel: UILabel!
    
    
    @IBOutlet weak var option1WrongImage: UIImageView!
    
    @IBOutlet weak var option1RightImage: UIImageView!
    
    @IBOutlet weak var option2WrongImage: UIImageView!
    
    @IBOutlet weak var option2RightImage: UIImageView!
    
    @IBOutlet weak var option3WrongImage: UIImageView!
    
    @IBOutlet weak var option3RightImage: UIImageView!
    
    @IBOutlet weak var option4WrongImage: UIImageView!
    
    @IBOutlet weak var option4RightImage: UIImageView!
    
    var labelView = UILabel()
    
    
    // MARK: - View Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.isHidden = true
        
        cornerRadius()
        imageviewIshidden()
        didtapChange()
        roundedprogress()
        loadData()
        fetchData()
    }
    @IBOutlet weak var labelIs: UILabel!
    
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
            //btnenabled()
            dataOption1.text = one!.option1
            dataOption2.text = one!.option2
            dataOption3.text = one!.option3
            dataOption4.text = one!.option4
        case 2:
            checkForAnswer(of: 1)
            count += 1
            let two = AssistHomeViewController.objRepositorys.get(byIdentifier: 2)
            questionNumber.text = "\(two!.questionNo)"
            question.text = two!.question
            //btnenabled()
            dataOption1.text = two!.option1
            dataOption2.text = two!.option2
            dataOption3.text = two!.option3
            dataOption4.text = two!.option4
            
        case 3:
            checkForAnswer(of: 2)
            count += 1
            let three = AssistHomeViewController.objRepositorys.get(byIdentifier: 3)
            questionNumber.text = "\(three!.questionNo)"
            question.text = three!.question
            //btnenabled()
            dataOption1.text = three!.option1
            dataOption2.text = three!.option2
            dataOption3.text = three!.option3
            dataOption4.text = three!.option4
            
        case 4:
            checkForAnswer(of: 3)
            count += 1
            let four = AssistHomeViewController.objRepositorys.get(byIdentifier: 4)
            questionNumber.text = "\(four!.questionNo)"
            question.text = four!.question
            //btnenabled()
            dataOption1.text = four!.option1
            dataOption2.text = four!.option2
            dataOption3.text = four!.option3
            dataOption4.text = four!.option4
            
        case 5:
            checkForAnswer(of: 4)
            count = 0
            let five = AssistHomeViewController.objRepositorys.get(byIdentifier: 5)
            questionNumber.text = "\(five!.questionNo)"
            question.text = five!.question
            //btnenabled()
            dataOption1.text = five!.option1
            dataOption2.text = five!.option2
            dataOption3.text = five!.option3
            dataOption4.text = five!.option4
        default:
            print("none")
        }
    }
    static var countCorrectAnswers = 0
    func checkForAnswer(of questionNumber: Int16) {
        let answer = AssistHomeViewController.objRepositorys.get(byIdentifier: questionNumber)?.answer
        for option in collectionOptionView {
        }
    }
    
    @IBAction func nextBtnAction(_ sender: Any) {
        fetchData()
        counter = 60
        didtapChange()
    }
    
    
    @IBAction func option1(_ sender: Any) {
        viewOfOption1.backgroundColor = .green
    }
    
    
    @IBAction func option2(_ sender: Any) {
        viewOfOption2.backgroundColor = .systemPink
    }
    
    @IBAction func option3(_ sender: Any) {
        
    }
    
    
    @IBAction func option4(_ sender: Any) {
        
    }
    
//    func btnenabled(){
//        option1Btn.isEnabled = true
//        option2Btn.isEnabled = true
//        option3Btn.isEnabled = true
//        option4Btn.isEnabled = true
//    }
    
    
    @objc func didtapChange(){
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
        //shape.strokeColor = UIColor.blue.cgColor
        shape.strokeColor = UIColor.green.cgColor
        shape.fillColor = UIColor.clear.cgColor
        shape.strokeEnd = 0
        
        view.layer.addSublayer(shape)
        
    }
    
    func cornerRadius(){
        //            questionNumber.layer.masksToBounds = true
        //            questionNumber.layer.cornerRadius = questionNumber.frame.size.width/2
        
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
        option4RightImage.layer.cornerRadius = option4RightImage.frame.size.width/2
        
        option4WrongImage.layer.masksToBounds = false
        option4WrongImage.clipsToBounds = true
        option4WrongImage.layer.cornerRadius = option4WrongImage.frame.size.width/2
        
        option4view.layer.cornerRadius = 10
        option3view.layer.cornerRadius = 10
        option2view.layer.cornerRadius = 10
        option1View.layer.cornerRadius = 10
    }
    func imageviewIshidden(){
        option1WrongImage.isHidden = true
        option1RightImage.isHidden = true
        
        option2WrongImage.isHidden = true
        option2RightImage.isHidden = true
        
        option3WrongImage.isHidden = true
        option3RightImage.isHidden = true
        
        option4WrongImage.isHidden = true
        option4RightImage.isHidden = true
    }
}
    

