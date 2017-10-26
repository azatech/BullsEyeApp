//
//  ViewController.swift
//  rayFirstApp
//
//  Created by Azat IOS on 25.10.17.
//  Copyright © 2017 azatech. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var slider: UISlider!
    
    @IBOutlet weak var targetValueLabel: UILabel!

    @IBOutlet weak var scoreLabel: UILabel!

    @IBOutlet weak var roundLabel: UILabel!

    var roundNumber = 1
    
    var currentValue = 50

    var targetValue = 0

    var score = 0

    // if targetValue > currentValue {
    //       targetValue - currentvALUE }
    // ELSE [ currentValue - targetValue
    //else if targetValue == currentValue
    // print ("W+HOOAAAA")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        currentValue = lroundf(slider.value)
        startOver()

        let thumbImageNormal = UIImage(named: "SliderThumb-Normal")
        slider.setThumbImage(thumbImageNormal, for: .normal)

        let thumbImageHighlighted = UIImage(named: "SliderThumb-Highlighted")
        slider.setThumbImage(thumbImageHighlighted, for: .highlighted)

        let insets = UIEdgeInsets(top: 0, left: 14, bottom: 0, right: 14)

        let trackLeftImage = UIImage(named: "SliderTrackLeft" )
        let trackLeftResizable = trackLeftImage?.resizableImage(withCapInsets: insets)
        slider.setMinimumTrackImage(trackLeftResizable, for: .normal)

        let trackRightImage = UIImage(named: "SliderTrackRight" )
        let trackRightResizable = trackRightImage?.resizableImage(withCapInsets: insets)
        slider.setMaximumTrackImage(trackRightResizable, for: .normal)



////        let trackLeftImage = UIImage(named: "SliderTrackLeft")
////        let trackLeftResizable = trackLeftImage?.resizableImage(withCapInsets: slider.setMinimumTrackImage(<#T##image: UIImage?##UIImage?#>, for: <#T##UIControlState#>), resizingMode: <#T##UIImageResizingMode#>)
//
//
//        let trackRightImage = UIImage(named: "SliderTrackRight")
//        let trackRightResizable = trackRightImage?.resizableImage(withCapInsets: slider.set, resizingMode: <#T##UIImageResizingMode#>)

    }

//    func updateLabelsaaaa (_ uIName: UILabel ) -> Int {
////        targetValueLabel.text = String(targetValue)
////        scoreLabel.text = String(score)
////        roundLabel.text = String(roundNumber)
//
//        return targetValueLabel.text = String(targetValue)
//
//
//   }
//
//    //
//    func updateLabelsaa


    func updateLabels() {
        targetValueLabel.text = String(targetValue)
        scoreLabel.text = String(score)
        roundLabel.text = String(roundNumber)

    }

    func startNewRound() {
        roundNumber += 1
        targetValue = 1 + Int(arc4random_uniform(100))
        currentValue = 50
        slider.value = Float(currentValue)
        updateLabels()

    }

    @IBAction func sliderMoved(_ slider: UISlider) {
        print("This slider value is \(slider.value)")
        currentValue = lroundf(slider.value)
    }

    @IBAction func showAlert() {

        let difference = abs(targetValue - currentValue)
        var points = 100 - difference

        var title = ""

        if difference == 0 {
            title = "Perfect!"
            points += 100
        } else if difference < 5 {
            title = "You almost had it!"
            if difference == 1 {
                points += 50
            }
        } else if difference < 10 {
            title = "Not even close ..."
        }

        score += points


        let message = "You scored \(points) points"


        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)

        let action = UIAlertAction(title: "Awesome!", style: .default, handler: {
            action in
                self.startNewRound()
            })

        alert.addAction(action)

        present(alert, animated: true, completion: nil)
    }

    @IBAction func startOver() {
        score = 0
        roundNumber = 0
        startNewRound()
    }
}

