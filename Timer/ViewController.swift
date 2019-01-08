//
//  ViewController.swift
//  Timer
//
//  Created by User10 on 2018/12/3.
//  Copyright © 2018 kelly. All rights reserved.
//

import UIKit
import AVFoundation



var timer : Timer?
var oldtime = "00"
let images = ["1","2","3","4","5","6","7","8","9","10","11","12","13","14","15","16","17","18"]
var i = 0

class ViewController: UIViewController {
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true, block: { (_) in
            let now = Date()
            let formatter = DateFormatter()
            let formatter1 = DateFormatter()
            formatter.dateFormat = "HH:mm:ss\nyyyy/MMM/dd E"
            formatter1.dateFormat = "HH"
            let font = UIFont(name: "Nagurigaki-Crayon", size: 32)
            let time = formatter.string(from: now)
            let time1 = formatter1.string(from: now)
            self.timeLabel.font = font
            self.timeLabel.text = time
            //print(time)
            
            formatter.dateFormat = "mm"
            let newtime = formatter.string(from: now)
            formatter.dateFormat = "ss"
            let newsecond = formatter.string(from: now)
            if newtime > oldtime || newsecond == "00" || newsecond == "10" || newsecond == "20" || newsecond == "30" || newsecond == "40" || newsecond == "50"{
                self.imageView.image = UIImage(named: images[i])
                //print(newsecond)
                oldtime = newtime
                i = i + 1
                if i >= 18{
                    i = 0
                }
            }
            if newtime == "00"{
                if newsecond == "00"{
                    let speechUtterance =  AVSpeechUtterance(string: "現在是" + time1 + "點整")
                    speechUtterance.voice = AVSpeechSynthesisVoice(language: "zh-TW")
                    let synth = AVSpeechSynthesizer()
                    synth.speak(speechUtterance)
                    print("speaking!")
                }
            }
        })
        }
    
    override func viewDidDisappear(_ animated: Bool) {
        if timer != nil {
            timer?.invalidate()
        }
    }
}

