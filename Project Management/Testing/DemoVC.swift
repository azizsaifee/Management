//
//  DemoVC.swift
//  Project Management
//
//  Created by Apple on 15/02/23.
//

import UIKit

class DemoVC: UIViewController {

    @IBOutlet weak var viewBelowFloatingViews: UIView!
    @IBOutlet var floatingViews: [UIView]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        design()
    }
    
    func design() {
        for view in floatingViews {
            view.layer.shadowColor = UIColor.black.cgColor
            view.layer.shadowOpacity = 0.5
            view.layer.shadowOffset = CGSize(width: 5, height: 5)
            view.layer.shadowRadius = 5
            view.layer.cornerRadius = 35
            view.clipsToBounds = true
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

    var count: Int = 0
    
    func getRandomPoint(of view: UIView) -> CGPoint {
        let viewWidth = view.bounds.width
        let viewHeight = view.bounds.height
        count += 1
        switch count {
        case 1:
            // Quadrant 1
            let randomX = CGFloat.random(in: 35...(viewWidth/2 - 35))
            let randomY = CGFloat.random(in: 35...(viewHeight/3 - 35))
            return CGPoint(x: randomX, y: randomY)
        case 2:
            // Quadrant 2
            print(viewHeight/3)
            print(viewWidth/2)
            let randomX = CGFloat.random(in: 35...(viewWidth/2 - 35))
            let randomY = CGFloat.random(in: (viewHeight/3 + 35)...(viewHeight * (2/3) - 35))
            return CGPoint(x: randomX, y: randomY)
        case 3:
            // Quadrant 3
            let randomX = CGFloat.random(in: 35...(viewWidth/2))
            let randomY = CGFloat.random(in: (viewHeight * (2/3) + 35)...viewHeight - 35)
            return CGPoint(x: randomX, y: randomY)
        case 4:
            // Quadrant 4
            print(viewHeight/2)
            let randomX = CGFloat.random(in: (viewWidth/2 + 35)...viewWidth - 35)
            let randomY = CGFloat.random(in: 35...(viewHeight/3) - 35)
            return CGPoint(x: randomX, y: randomY)
        case 5:
            // Quadrant 5
            let randomX = CGFloat.random(in: (viewWidth/2 + 35)...viewWidth - 35)
            let randomY = CGFloat.random(in: (viewHeight/3 + 35)...(viewHeight * (2/3) - 35))
            return CGPoint(x: randomX, y: randomY)
        case 6:
            count = 0
            // Quadrant 6
            let randomX = CGFloat.random(in: (viewWidth/2 + 35)...(viewWidth - 35))
            let randomY = CGFloat.random(in: (viewHeight * (2/3) + 35)...(viewHeight - 35))
            return CGPoint(x: randomX, y: randomY)
        default:
            return CGPoint(x: 0, y: 0)
        }
    }
}
