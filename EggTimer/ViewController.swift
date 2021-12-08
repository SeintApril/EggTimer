//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var titleLable: UILabel!
    let eggTimes = ["Soft": 3, "Medium": 4, "Hard": 7]
    
    var timer = Timer()
    
    var totalSeconds = 0;
    
    var secondPssed = 0;

    @IBAction func eggCondition(_ sender: UIButton) {
        timer.invalidate()
        let hardness = sender.currentTitle
        
        totalSeconds = eggTimes[hardness!]!
        
        progressBar.progress = 0.0
        secondPssed =  0
        titleLable.text = hardness
        
        Timer.scheduledTimer(timeInterval: 1.0, target: self, selector:
            #selector(updateTimer), userInfo: nil, repeats: true)
        
    }
    @objc func updateTimer() {
            if secondPssed < totalSeconds {
                
//                let percentageProgress = secondPssed / totalSeconds
                secondPssed += 1
                progressBar.progress = Float(secondPssed) / Float (totalSeconds)
              
            } else {
                timer.invalidate()
                titleLable.text = "Done!"
            }
    }
    
}
