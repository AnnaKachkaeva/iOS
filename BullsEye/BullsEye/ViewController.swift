//
//  ViewController.swift
//  BullsEye
//
//  Created by Анна Качкаева on 23.09.2021.
//

import UIKit

class ViewController: UIViewController {
    
    @IBAction func resetGame(_ sender: UIButton) {
        game.reset()
        startNewRound()
    }
    @IBAction func sliderMoved(_ sender: UISlider) {
    }
    @IBOutlet weak var slider : UISlider!
    @IBOutlet weak var message : UILabel!
    @IBOutlet weak var scoreOutlet: UILabel!
    @IBOutlet weak var roundLabel: UILabel!
    struct randomGoal {
        var value : Int = Int.random(in: 0...100)
        
        mutating func reset() {
            self.value = Int.random(in: 0...100)
        }
    }
    var goal = randomGoal()
    
    
    struct Game {
        var earned : Int = 0
        var round : Int = 1
        var difficulty = 20
        
        mutating func calculate(goal: Int, slider: Int) -> Int {
            let earnedNow = difficulty - abs(goal - slider)
            self.earned += earnedNow
            self.round += 1
            return earnedNow
        }
        
        mutating func reset() {
            self.earned = 0
            self.round = 1
        }
    }
    var game = Game()
    
    
    func startNewRound(){
        goal.reset()
        //slider.value = 50
        message.text = "Put the Bull's eye as close as you can to \(goal.value)"
        scoreOutlet.text = "\(game.earned)"
        roundLabel.text = "\(game.round)"
    }
    
    
    @IBAction func showAllert() {
        let title: String
        var earned = game.calculate(goal: self.goal.value, slider: Int(self.slider.value))

        //print(earned)
        switch earned {
        case 18...20:
            game.earned += 100
            earned += 100
            title = "you've earned \(earned)\nPerfect!"
        case 8...17:
            title = "you've earned \(earned)\ngood enaught"
        case 1...7:
            title = "you've earned \(earned)\nnice"
        case ...0:
            title = "you've earned \(earned)\noooops"
        default:
            title = "you've earned \(earned)\nsome"
        }
    
        
        let allert = UIAlertController (
            title: title,
            message: "yours : \(Int(round(slider.value))), goal : \(goal.value)",
            preferredStyle: .alert)
        
        let action = UIAlertAction (
            title: "ok",
            style: .default){ _ in
                //self.game.calculate(goal: self.goal.value, slider: Int(self.slider.value))
                self.startNewRound()
            }
        
        
        allert.addAction(action)
        present(allert, animated: false, completion: nil)
    }
   

    override func viewDidLoad() {
        
       // self.view.backgroundColor = UIColor(patternImage: UIImage(named: "forest.png")!)  //set bacground pic
        super.viewDidLoad()
        game.reset()
        startNewRound()
    }


}

