//
//  FaltuCode.swift
//  Project Management
//
//  Created by 5Exceptions_Mac1 on 14/02/23.
//

import Foundation

/*
    func startTimer() {
        Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { (timer) in
            //let currentPosition = floatingView.layer.presentation()!.frame.origin
            for x in self.floatingViewCollection {
                for y in self.floatingViewCollection {
                    if x != y && x.frame.intersects(y.frame) {
                        //print("this")
                        self.animate(with: x, signal: true)
                    }
                }
            }
        }
    }
 
 func design() {
     for view in viewCollection {
         view.layer.shadowColor = UIColor.black.cgColor
         view.layer.shadowOpacity = 0.5
         view.layer.shadowOffset = CGSize(width: 5, height: 5)
         view.layer.shadowRadius = 5
         view.subviews.first!.layer.cornerRadius = 35
         view.subviews.first!.clipsToBounds = true
         self.animate(with: view)
     }
 }
 
 func animate(with viewBelowFloatingView: UIView) {
     let animator = UIViewPropertyAnimator(duration: 4.0, curve: .linear) {
         viewBelowFloatingView.subviews.first!.center = self.getRandomPoint(of: viewBelowFloatingView)
     }
     animator.startAnimation()
     animator.addCompletion { position in
         if position == .end {
             self.animate(with: viewBelowFloatingView)
         }
     }
 }
 
 func getRandomPoint(of view: UIView) -> CGPoint {
     let screenWidth = view.bounds.width
     let screenHeight = view.bounds.height
     
     let randomX = CGFloat.random(in: 35...screenWidth - 35)
     let randomY = CGFloat.random(in: 35...screenHeight - 35)
     
     return CGPoint(x: randomX, y: randomY)
 }
 
 
 
*/
