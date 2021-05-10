//
//  ViewController.swift
//  猜數字
//
//  Created by 蔡佳穎 on 2021/5/10.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var numberTextField: UITextField!
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var playTimesLabel: UILabel!
    @IBOutlet weak var lookImageView: UIImageView!
    @IBOutlet weak var poorImageView: UIImageView!
    @IBOutlet weak var closeImageView: UIImageView!
    
    var answerNumber = Int.random(in: 0...50)
    var playTime = 6
    var min = 0
    var max = 50

    override func viewDidLoad() {
        super.viewDidLoad()
        
        lookImageView.isHidden = false
        poorImageView.isHidden = true
        closeImageView.isHidden = true
        resultLabel.text = "測試你的慧根到哪！"
        playTimesLabel.text = "還能猜\(playTime)次"
    }

    @IBAction func guess(_ sender: UIButton) {
        
        view.endEditing(true)

        let guessNumberText = numberTextField.text!
        let guessNumber = Int(guessNumberText)
        
        if playTime >= 0 {
            playTime -= 1
            if let guessNumber = guessNumber {
                if guessNumber == answerNumber {
                    resultLabel.text = "冰雪聰明！可以開始摸了❤️"
                    resultLabel.sizeToFit()
                    playTimesLabel.text = "還能猜\(playTime)次"
                    lookImageView.isHidden = true
                    poorImageView.isHidden = true
                    closeImageView.isHidden = false
                } else if guessNumber > answerNumber {
                    max = guessNumber - 1
                    resultLabel.text = "太多也是會阿雜(\(min)-\(guessNumber - 1))"
                    resultLabel.sizeToFit()
                    numberTextField.text = ""
                    if playTime == 0 {
                        playTimesLabel.text = "沒默契，我好可憐嗚嗚"
                        lookImageView.isHidden = true
                        poorImageView.isHidden = false
                        closeImageView.isHidden = true
                    } else {
                        playTimesLabel.text = "還能猜\(playTime)次"
                    }
                } else {
                    min = guessNumber + 1
                    resultLabel.text = "太少了吧！沒誠意！(\(guessNumber + 1)-\(max))"
                    resultLabel.sizeToFit()
                    numberTextField.text = ""
                    if playTime == 0 {
                        playTimesLabel.text = "沒默契，我好可憐嗚嗚"
                        lookImageView.isHidden = true
                        poorImageView.isHidden = false
                        closeImageView.isHidden = true
                    } else {
                        playTimesLabel.text = "還能猜\(playTime)次"
                    }
                }
            }
        }
    }
    
    @IBAction func playAgain(_ sender: UIButton) {
        view.endEditing(true)
        playTime = 6
        answerNumber = Int.random(in: 0...50)
        min = 0
        max = 50
        numberTextField.text = ""
        resultLabel.text = "測試你的慧根到哪！"
        playTimesLabel.text = "還能猜\(playTime)次"
        lookImageView.isHidden = false
        poorImageView.isHidden = true
        closeImageView.isHidden = true
    }
}

