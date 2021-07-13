//
//  ViewController.swift
//  HelloWorld
//
//  Created by Анна Качкаева on 12.07.2021.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func showMessage(sender: UIButton) {
        
        let dict: [String:String] = ["🦷":"My teath are swords",
                                     "💅🏼":"my claws spears",
                                     "🦋":"my wings a hurricane",
                                     "🐉":"I'm fire, I'm death"]
        //the sender is the button whitch is selected by the user
        //we store the sender in constant
        let selectedButton = sender
        
        //get emoji from typed button
        if let LookUp = selectedButton.titleLabel?.text{
            let text : String? = dict[LookUp]
        
        
            let alertController = UIAlertController(title: "Your Smaug said:", message:text, preferredStyle: UIAlertController.Style.alert)
            
            alertController.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
            
            present(alertController, animated: true, completion: nil)
        }
    }


}

