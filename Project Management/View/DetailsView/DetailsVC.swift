//
//  DetailsVC.swift
//  Project Management
//
//  Created by Apple on 08/02/23.
//

import UIKit

class DetailsVC: UIViewController {

    // MARK :- Variables
    static var objForAppDataRepository = AppDataRepository()
    static var stringForTitle: String?
    var count = 0
    
    // MARK: - IBOutlets
    @IBOutlet weak var viewBelowFloatingViews: UIView!
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var labelForTittle: UILabel!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var lblFeaturesView: UIView!
    @IBOutlet weak var lblDocumentation: UIView!
    @IBOutlet weak var lblCredentialsView: UIView!
    @IBOutlet weak var lblIssuesView: UIView!
    
    @IBOutlet var floatingViews: [UIView]!
    
    // MARK: - View Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        labelForTittle.text = DetailsVC.stringForTitle
        design()
        handlingClicksOnFloatingView()
        addHeader()
        loadData()
    }
    
    // MARK: Required Methods
    func loadData() {
        if DetailsVC.objForAppDataRepository.get(byIdentifier: "EcoBank") == nil {
            DetailsVC.objForAppDataRepository.create(data: dataOfEcoBank)
        } else {
            if DetailsVC.objForAppDataRepository.get(byIdentifier: "EcoBank")! != dataOfEcoBank {
                let deleteSuccessOrNot = DetailsVC.objForAppDataRepository.delete(byIdentifier: "EcoBank")
                print(deleteSuccessOrNot)
                DetailsVC.objForAppDataRepository.create(data: dataOfEcoBank)
            }
        }
    }
    
    func addHeader() {
        let headerView = UIView(frame: CGRect(x: 0, y: 0, width: tableView.frame.width, height: 50))
        headerView.backgroundColor = .white
        let headerLabel = UILabel(frame: CGRect(x: 10, y: 0, width: headerView.frame.width - 20, height: headerView.frame.height))
        headerLabel.textAlignment = .center
        headerLabel.text = "Recents"
        headerLabel.font = UIFont.boldSystemFont(ofSize: 24)
        headerLabel.textColor = .black
        headerView.addSubview(headerLabel)
        tableView.tableHeaderView = headerView
    }
    
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

    func getRandomPoint(of view: UIView) -> CGPoint {
        let viewWidth = view.bounds.width
        let viewHeight = view.bounds.height
        count += 1
        switch count {
        case 1:
            // Quadrant 1
            let randomX = CGFloat.random(in: 40...(viewWidth/2 - 40))
            let randomY = CGFloat.random(in: 40...(viewHeight/2 - 40))
            return CGPoint(x: randomX, y: randomY)
        case 2:
            // Quadrant 2
            let randomX = CGFloat.random(in: 40...(viewWidth/2 - 40))
            let randomY = CGFloat.random(in: (viewHeight/2 + 40)...(viewHeight - 40))
            return CGPoint(x: randomX, y: randomY)
        case 3:
            // Quadrant 3
            let randomX = CGFloat.random(in: (viewWidth/2 + 40)...viewWidth - 40)
            let randomY = CGFloat.random(in: 40...(viewHeight/2) - 40)
            return CGPoint(x: randomX, y: randomY)
        case 4:
            // Quadrant 4
            count = 0
            let randomX = CGFloat.random(in: (viewWidth/2 + 40)...viewWidth - 40)
            let randomY = CGFloat.random(in: (viewHeight/2 + 40)...(viewHeight - 40))
            return CGPoint(x: randomX, y: randomY)
        default:
            return CGPoint(x: 0, y: 0)
        }
    }
    
    func handlingClicksOnFloatingView() {
        // for description.
        let documentation = UITapGestureRecognizer(target: self, action: #selector(handleTap(sender:)))
        documentation.name = "documentation"
        lblDocumentation.addGestureRecognizer(documentation)
        
        // for issues.
        let issues = UITapGestureRecognizer(target: self, action: #selector(handleTap(sender:)))
        issues.name = "issues"
        lblIssuesView.addGestureRecognizer(issues)
        
        // for credentials.
        let credentials = UITapGestureRecognizer(target: self, action: #selector(handleTap(sender: )))
        credentials.name = "credentials"
        lblCredentialsView.addGestureRecognizer(credentials)
        
        // for features.
        let features = UITapGestureRecognizer(target: self, action: #selector(handleTap(sender:)))
        features.name = "features"
        lblFeaturesView.addGestureRecognizer(features)
    }
    
    @objc func handleTap(sender: UITapGestureRecognizer) {
        let viewAfterDetailsVC = self.storyboard?.instantiateViewController(withIdentifier: "ViewAfterDetailsVC") as! ViewAfterDetailsVC
        switch sender.name {
        case "documentation" :
            ViewAfterDetailsVC.stringForTitle = "Documentation"
            self.navigationController?.pushViewController(viewAfterDetailsVC, animated: true)
        case "features" :
            self.navigationController?.pushViewController(viewAfterDetailsVC, animated: true)
            ViewAfterDetailsVC.stringForTitle = "Features"
        case "credentials" :
            self.navigationController?.pushViewController(viewAfterDetailsVC, animated: true)
            ViewAfterDetailsVC.stringForTitle = "Credentials"
        case "issues" :
            self.navigationController?.pushViewController(viewAfterDetailsVC, animated: true)
            ViewAfterDetailsVC.stringForTitle = "Issues"
        default:
            print("None was found!")
        }
    }
    
    // MARK: - IBActions
    @IBAction func backButtonAction(_ sender: UIButton) {
        sender.setTitle("<iosApps", for: .normal)
        self.navigationController?.popViewController(animated: true)
    }
}
