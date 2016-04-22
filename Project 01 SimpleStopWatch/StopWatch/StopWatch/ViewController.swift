//
//  ViewController.swift
//  StopWatch
//
//  Created by leohe on 16/4/22.
//  Copyright © 2016年 getong. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var timeLabel: UILabel!
   
    @IBOutlet weak var StopBtn: UIButton!
    @IBOutlet weak var PlayBtn: UIButton!
    
    var Counter = 0.0
    var Timer = NSTimer()
    var IsPlaying = false
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return UIStatusBarStyle.LightContent
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        timeLabel.text = String(Counter)
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func playButtonDidTouch(sender: AnyObject) {
        if IsPlaying {
            return
        }
        
        PlayBtn.enabled = false
        StopBtn.enabled = true
        Timer = NSTimer.scheduledTimerWithTimeInterval(0.1, target: self, selector: #selector(ViewController.UpdateTimer), userInfo: nil, repeats: true)
        IsPlaying = true
    }
    

    @IBAction func pauseButtonTouch(sender: AnyObject) {
        PlayBtn.enabled = true
        StopBtn.enabled = false
        Timer.invalidate()
        IsPlaying = false
        
    }
    
    @IBAction func ResetBtnTouch(sender: AnyObject) {
        Timer.invalidate()
                IsPlaying = false
                Counter = 0.0
                timeLabel.text = String(Counter)
                PlayBtn.enabled = true
                StopBtn.enabled = true
    }

    
    func UpdateTimer() {
        Counter+=0.1
        timeLabel.text = String(format: "%.1f", Counter)
    }
    
}

