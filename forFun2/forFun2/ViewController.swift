//
//  ViewController.swift
//  forFun2
//
//  Created by Анна Качкаева on 19.07.2021.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var termTextfield: UITextField!
    @IBOutlet weak var InterestRateField: UITextField!
    @IBOutlet weak var DepositeField: UITextField!
    @IBOutlet weak var IncreseField: UITextField!

    @IBOutlet weak var total: UILabel!
    @IBOutlet weak var additions: UILabel!
    @IBOutlet weak var interests: UILabel!
    
    @IBOutlet var calculateButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        termTextfield.keyboardType = .numberPad
        InterestRateField.keyboardType = .numberPad
        DepositeField.keyboardType = .numberPad
        IncreseField.keyboardType = .numberPad

    }
    
    @IBAction func calculate() {
        termTextfield.resignFirstResponder()
        InterestRateField.resignFirstResponder()
        DepositeField.resignFirstResponder()
        IncreseField.resignFirstResponder()
        
        let result = counting(term: Int(termTextfield.text!) ?? 5, rate: Int(InterestRateField.text!) ?? 10, deposite: Int(DepositeField.text!) ?? 80000, increse: Int(IncreseField.text!) ?? 5000)
        
        total.text = "💰total\t" + readAble(badStr: String(result[0]))
        additions.text = "🥪additions\t" + readAble(badStr: String(result[1]))
        interests.text = "💹interests\t" + readAble(badStr: String(result[2]))
        }
    

}

func counting(term: Int, rate: Int, deposite: Int, increse: Int) -> Array<Int>{
    
    //answer[0] - total
    //answer[1] - additions
    //answer[2] - interest
    var answer: Array<Int> = [ 0, 0, 0]
    if term*rate*deposite*increse != 0 {
        
        let PWT = Double(increse) //366306.0
        let percents = (Double(rate)/100)
        let first = pow(1.0 + percents, Double(term)) - 1.0
        let round = Double(round(PWT * first * 12 / percents * 100)/100)
        
        //deposite * 
        
        answer[0] = Int(round)
            
        answer[1] += Int(12 * term * increse)
        answer[2] += Int(answer[0] - answer[1])
            
        return answer
    } else {
        return answer
    }
}

func readAble(badStr: String) -> String {
    var goodString: String = ""
    var counter = 3
    
    let badStr = badStr.reversed()
    
    for char in badStr {//000 003
        if counter != 0 {
            goodString += String(char)
            counter -= 1
        } else {
            counter = 2
            goodString += " " + String(char)
        }
    }
    
    goodString = String(goodString.reversed())
    
    return goodString
}

