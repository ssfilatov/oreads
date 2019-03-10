//
//  TableViewController.swift
//  oreads
//
//  Created by Sergey Filatov on 02/03/2019.
//  Copyright © 2019 Sergey Filatov. All rights reserved.
//

import Foundation
import UIKit



class BookController: UITableViewController {
    
    var tableItems: [String: [(String, String)]] = [String: [(String, String)]]()
    
    override func viewDidLoad() {
        //this should be removed once custom s3 provider is implemented
        var parts: [(String, String)] = [(String, String)]()
        for i in 1...31 {
            parts.append((String(i), "https://hb.bizmrg.com/oreads/mythos/mythos-\(i).m4b"))
        }
        tableItems["Mythos by Stephen Fry"] = parts
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let TableViewCell = tableView.dequeueReusableCell(withIdentifier: "BookCell")
        TableViewCell!.textLabel?.text = Array(tableItems.keys)[indexPath.row]
        
        return TableViewCell!
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableItems.count
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowPartsSegue" {
            let cell = sender as! UITableViewCell
            if let indexPath = tableView.indexPath(for: cell) {
                let bookPartController = segue.destination as! BookPartController
                bookPartController.loadViewIfNeeded()
                bookPartController.initParts(items: Array(tableItems.values)[indexPath.row])
                tableView.deselectRow(at: indexPath, animated: true)
            }
        }
    }
    
    
}
