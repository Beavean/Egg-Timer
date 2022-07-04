//
//  ViewController.swift
//  Egg Timer
//
//  Created by Beavean on 01.07.2022.
//

import UIKit

class ViewController: UIViewController {
    
    let eggTimes = ["Soft": 2, "Medium": 3, "Hard": 4]
    
    var totalTime = 0
    
    var secondsPassed = 0

    var timer = Timer()
    
    @IBOutlet weak var progressBar: UIProgressView!
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBAction func timerSelected(_ sender: UIButton) {
        
        timer.invalidate()
        
        let hardness = sender.currentTitle!
        
        totalTime = eggTimes[hardness]!
        
        progressBar.progress = 0.0
        secondsPassed = 0
        titleLabel.text = hardness
        
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(setTimer), userInfo: nil, repeats: true)
    }
    
    @objc func setTimer() {
        if secondsPassed < totalTime {
            
            secondsPassed += 1
            progressBar.progress  = Float(secondsPassed) / Float(totalTime)
            
        } else {
            timer.invalidate()
            titleLabel.text = "Done!"
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }


}

