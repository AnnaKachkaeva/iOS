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
    var items : [ChecklistItem] = []
   




    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let cellsAmount = 50
        
        for i in 0..<cellsAmount {
            let item = ChecklistItem()
            item.text = "i am \(i) element here"
            items.append(item)
        }
        
        return cellsAmount
    }
    

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ChecklistItem", for: indexPath)
        let label = cell.viewWithTag(1000) as! UILabel
                
        let item = items[indexPath[1]]
        label.text = item.text
        configureCheckmark(for: cell, with: item)
        
        return cell
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let cell = tableView.cellForRow(at: indexPath) { // checkes if there is cell tapped
            items[indexPath[1]].checked.toggle()
            configureCheckmark(for: cell, with: items[indexPath[1]])
        }
        
        tableView.deselectRow(at: indexPath, animated: true)
    }


    func configureCheckmark(for cell: UITableViewCell, with item: ChecklistItem){

        if item.checked {
            cell.accessoryType = .checkmark
        } else {
            cell.accessoryType = .none
        }

    }
}

