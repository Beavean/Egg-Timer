//
//  ViewController.swift
//  Egg Timer
//
//  Created by Beavean on 01.07.2022.
//

import UIKit

class ViewController: UIViewController {
    
    let eggTimes = ["Soft": 300, "Medium": 420, "Hard": 660]
    
    var remainingSeconds = 60

    var timer = Timer()
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBAction func timerSelected(_ sender: UIButton) {
        
        let hardness = sender.currentTitle!
        
        remainingSeconds = eggTimes[hardness]!
        
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(setTimer), userInfo: nil, repeats: true)
    }
    
    @objc func setTimer() {
        if remainingSeconds > 0 {
            print("\(remainingSeconds) seconds.")
            remainingSeconds -= 1
        } else {
            timer.invalidate()
            titleLabel.text = "Done!"
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }


}

