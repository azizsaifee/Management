//
//  POpUpViewController.swift
//  Project Management
//
//  Created by 5Exceptions_Mac1 on 23/02/23.
//

import UIKit

class PopUpVC: UIViewController {
    
    var passData = ""
    
  //  MARK:- @IBOutlet
    
    @IBOutlet weak var main: UIView!
    @IBOutlet weak var titleLabl: UILabel!
    
    @IBOutlet weak var labelForTotalQuestions: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.black.withAlphaComponent(0.8 )
        self.addAnimation()
        main.layer.cornerRadius = 15
        main.layer.masksToBounds = true;
        main.backgroundColor = UIColor.white
        main.layer.shadowColor = UIColor.lightGray.cgColor
        main.layer.shadowOpacity = 0.8
        main.layer.shadowOffset = CGSize(width: 0.0, height: 0.0)
        main.layer.shadowRadius = 6.0
        main.layer.masksToBounds = false
        self.titleLabl.text = passData
        self.labelForTotalQuestions.text = "\(questionArray.count) Questions."
    }
    
    //  MARK:- @IBAction
    
    @IBAction func goToQuizBtn(_ sender: Any) {
        
        switch passData{
        case "IOS Quiz":
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "AssistHomeViewController")as! QuizHomeVC
            self.navigationController?.pushViewController(vc, animated: true)
            
        case "Android Quiz":
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "AndroidVC")as! AndroidVC
            self.navigationController?.pushViewController(vc, animated: true)
            
        default:
            print("some")
        }
        
    }
    
    
    @IBAction func closePopupBtn(_ sender: Any) {
        removeAnimation()
    }
    
   // MARK:- func AddAnimation and removeAnimation
    
    func addAnimation(){
        self.main.transform = CGAffineTransform(translationX:0,y:250)
        UIView.animate(withDuration: 0.5, animations: {
            self.main.transform = .identity
        })
        
    }
    
    func removeAnimation(){
        self.main.transform = .identity
        UIView.animate(withDuration: 0.5  ,animations:  {
            self.main.transform = CGAffineTransform(translationX:0,y:250)
        }){ (complete) in
            self.view.removeFromSuperview()
            
        }
        
    }
}
