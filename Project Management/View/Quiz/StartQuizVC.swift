//
//  StartAssistViewController.swift
//  Project Management
//
//  Created by 5Exceptions_Mac1 on 20/02/23.
//

import UIKit

class StartQuizVC: UIViewController {

    // MARK: - Variables
    var count: Int = 0
    
    // MARK: IBOutlets
    @IBOutlet weak var lblWebsite: UIView!
    @IBOutlet weak var lblWebapp: UIView!
    @IBOutlet weak var lblApple: UIView!
    @IBOutlet weak var lblSalesforce: UIView!
    @IBOutlet weak var lblAndroid: UIView!
    @IBOutlet weak var lblFlutter: UIView!
    @IBOutlet weak var viewBelowFloatingViews: UIView!
    @IBOutlet var floatingViews: [UIView]!
    
    // MARK: View Methods.
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.isHidden = true
        tabBarController?.tabBar.isHidden = false
        design()
        tapOnButton()
    }

    // MARK: Required Methods
    func tapOnButton() {
        // for apple button.
        let apple = UITapGestureRecognizer(target: self, action: #selector(buttonTapped(sender:)))
        apple.name = "apple"
        lblApple.addGestureRecognizer(apple)
        
        // for android button.
        let android = UITapGestureRecognizer(target: self, action: #selector(buttonTapped(sender:)))
        android.name = "android"
        lblAndroid.addGestureRecognizer(android)
        
        // for salesforce button.
        let salesforce = UITapGestureRecognizer(target: self, action: #selector(buttonTapped(sender:)))
        salesforce.name = "salesforce"
        lblSalesforce.addGestureRecognizer(salesforce)
        
        // for flutter button.
        let flutter = UITapGestureRecognizer(target: self, action: #selector(buttonTapped(sender:)))
        flutter.name = "flutter"
        lblFlutter.addGestureRecognizer(flutter)
        
        // for webapp button.
        let webapp = UITapGestureRecognizer(target: self, action: #selector(buttonTapped(sender:)))
        webapp.name = "webapp"
        lblWebapp.addGestureRecognizer(webapp)
        
        // for website button.
        let website = UITapGestureRecognizer(target: self, action: #selector(buttonTapped(sender:)))
        website.name = "website"
        lblWebsite.addGestureRecognizer(website)
    }
    
    @objc func buttonTapped(sender: UITapGestureRecognizer) {
        switch sender.name {
        case "apple":

            let iOSVC = self.storyboard?.instantiateViewController(withIdentifier: "PopUpVC") as! PopUpVC
            iOSVC.passData = "IOS Quiz"
            self.addChild(iOSVC)
            self.view.addSubview(iOSVC.view)
            iOSVC.didMove(toParent: self)

        case "android":
            let androidVC = self.storyboard?.instantiateViewController(withIdentifier: "PopUpVC") as! PopUpVC
            androidVC.passData = "Android Quiz"
            self.addChild(androidVC)
            self.view.addSubview(androidVC.view)
            androidVC.didMove(toParent: self)
        case "salesforce" :
            let salesforceVC = self.storyboard?.instantiateViewController(withIdentifier: "SalesforceVC") as! SalesforceVC
            self.navigationController?.pushViewController(salesforceVC, animated: true)
        case "flutter":
            let flutterVC = self.storyboard?.instantiateViewController(withIdentifier: "FlutterVC") as! FlutterVC
            self.navigationController?.pushViewController(flutterVC, animated: true)
        case "website" :
            let websiteVC = self.storyboard?.instantiateViewController(withIdentifier: "WebsiteVC") as! WebsiteVC
            self.navigationController?.pushViewController(websiteVC, animated: true)
        case "webapp":
            let webappVC = self.storyboard?.instantiateViewController(withIdentifier: "WebappVC") as! WebappVC
            self.navigationController?.pushViewController(webappVC, animated: true)
        default :
            print("nil found")
        }
    }
    

    // This function is used to give basic design to the floating Views.
    func design() {
        for view in floatingViews {
            view.layer.shadowColor = UIColor.black.cgColor
            view.layer.shadowOpacity = 0.5
            view.layer.shadowOffset = CGSize(width: 5, height: 5)
            view.layer.shadowRadius = 5
            view.layer.cornerRadius = 40
            self.animate(with: view)
        }
    }
    

    // This function is used to provide animation to the floating views.
    func animate(with floatingViews: UIView) {
        let animator = UIViewPropertyAnimator(duration: 4.0, curve: .linear) {
            floatingViews.center = self.getRandomPoint(of: self.viewBelowFloatingViews)
        }
        animator.startAnimation()
        animator.addCompletion { position in
            if position == .end {
                self.animate(with: floatingViews)
            }
        }
    }


    // This functions gives floating views random points to float into.
    func getRandomPoint(of view: UIView) -> CGPoint {
        let viewWidth = view.bounds.width
        let viewHeight = view.bounds.height
        count += 1
        switch count {
        case 1:
            // Quadrant 1
            let randomX = CGFloat.random(in: 40...(viewWidth/2 - 40))
            let randomY = CGFloat.random(in: 40...(viewHeight/3 - 40))
            return CGPoint(x: randomX, y: randomY)
        case 2:
            // Quadrant 2
            let randomX = CGFloat.random(in: 40...(viewWidth/2 - 40))
            let randomY = CGFloat.random(in: (viewHeight/3 + 40)...(viewHeight * (2/3) - 40))
            return CGPoint(x: randomX, y: randomY)
        case 3:
            // Quadrant 3
            let randomX = CGFloat.random(in: 40...(viewWidth/2))
            let randomY = CGFloat.random(in: (viewHeight * (2/3) + 40)...viewHeight - 40)
            return CGPoint(x: randomX, y: randomY)
        case 4:
            // Quadrant 4
            let randomX = CGFloat.random(in: (viewWidth/2 + 40)...viewWidth - 40)
            let randomY = CGFloat.random(in: 40...(viewHeight/3) - 40)
            return CGPoint(x: randomX, y: randomY)
        case 5:
            // Quadrant 5
            let randomX = CGFloat.random(in: (viewWidth/2 + 40)...viewWidth - 40)
            let randomY = CGFloat.random(in: (viewHeight/3 + 40)...(viewHeight * (2/3) - 40))
            return CGPoint(x: randomX, y: randomY)
        case 6:
            count = 0
            // Quadrant 6
            let randomX = CGFloat.random(in: (viewWidth/2 + 40)...(viewWidth - 40))
            let randomY = CGFloat.random(in: (viewHeight * (2/3) + 40)...(viewHeight - 40))
            return CGPoint(x: randomX, y: randomY)
        default:
            return CGPoint(x: 0, y: 0)
        }
    }
    
    
}
