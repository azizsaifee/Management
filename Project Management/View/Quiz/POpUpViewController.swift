//
//  POpUpViewController.swift
//  Project Management
//
//  Created by 5Exceptions_Mac1 on 23/02/23.
//

import UIKit

class POpUpViewController: UIViewController {
    @IBOutlet weak var main: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.black.withAlphaComponent(0.8 )
        self.addAnimation()
        
    }
    

    @IBAction func goToQuizBtn(_ sender: Any) {
    }
    

    @IBAction func closePopupBtn(_ sender: Any) {
        removeAnimation()
    }
    
    func addAnimation(){
        self.main.transform = CGAffineTransform(translationX:0,y:250)
        UIView.animate(withDuration: 0.5, animations: {
            self.main.transform = .identity
        })
        
    }
    func removeAnimation(){
        self.main.transform = .identity
        UIView.animate(withDuration: 0.5 ,animations:  {
            self.main.transform = CGAffineTransform(translationX:0,y:250)
        }){ (complete) in
            self.view.removeFromSuperview()
            
        }
        
    }
}
