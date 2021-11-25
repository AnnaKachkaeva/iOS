//
//  ViewController.swift
//  Checklist
//
//  Created by Анна Качкаева on 07.10.2021.
//

import UIKit
//MARK:  Table View Data Source
//TODO: dfghjk
//FIXME: fghjkl

class ChecklistViewController: UITableViewController {
    var row0checked = true
    var row1checked = true
    var row2checked = true
    var row3checked = true
    var row4checked = true




    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 50
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ChecklistItem", for: indexPath)
        let label = cell.viewWithTag(1000) as! UILabel
        
        
        label.text = " row  number \(indexPath[1])"
        
        
        
        return cell
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        //написать функцию которая запоминает значения для первых 5 клеток
        
        var isChecked = false
        
        if let cell = tableView.cellForRow(at: indexPath) { // checkes if there is cell tapped
           
            switch indexPath.row {
            case 0:
                row0checked.toggle()
                isChecked = row0checked
            case 1:
                row1checked.toggle()
                isChecked = row1checked
            case 2:
                row2checked.toggle()
                isChecked = row2checked
            case 3:
                row3checked.toggle()
                isChecked = row3checked
            case 4:
                row4checked.toggle()
                isChecked = row4checked
                
            default:
                isChecked = false
            }
            
            
            if isChecked { //if there is no checkmark
                cell.accessoryType = .checkmark //let it be
            } else { //if there is one
                cell.accessoryType = .none //errase it
            }
        }
        
        tableView.deselectRow(at: indexPath, animated: true)
    }


}

