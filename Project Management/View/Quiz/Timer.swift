//
//  Timer.swift
//  Project Management
//
//  Created by 5Exceptions_Mac1 on 20/02/23.
//

import Foundation
import UIKit

extension AssistHomeViewController{
   
    
    // MARK: - View Methods
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        resumeTimer()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        pauseTimer()
    }

    // MARK: Required Methods
    func pauseTimer() {
        print("Stop it")
        timer?.invalidate()
        remainingTime = timer?.fireDate.timeIntervalSinceNow ?? 0.0
        print(remainingTime)
    }
    
    func resumeTimer() {
        // Timer Runs at an interval of 20 seconds.
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { [weak self] timer in
            print(self?.counter ?? 0)
            self?.counter -= 1
            if self!.counter == 0 {
                self!.remainingTime = 0
                self?.counter = 60
                //self?.timer?.invalidate()
                // Do something when the timer reaches 20 seconds
                print("Times Up!")
                self!.fetchData()
                self!.didTapChange()
                self?.original()
            }
        }
        timer?.fireDate = Date().addingTimeInterval(remainingTime)
    }
    
}
