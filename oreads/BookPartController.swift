//
//  TableViewController.swift
//  oreads
//
//  Created by Sergey Filatov on 02/03/2019.
//  Copyright © 2019 Sergey Filatov. All rights reserved.
//

import Foundation
import UIKit



class BookPartController: UITableViewController {
    
    var tableItems: [(String, String)]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableItems = []
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    //this method will populate the table view
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let TableViewCell = tableView.dequeueReusableCell(withIdentifier: "BookPartCell")
        
        //adding the item to table row
        TableViewCell!.textLabel?.text = tableItems![indexPath.row].0
        
        return TableViewCell!
    }
    
    
    //this method will return the total rows count in the table view
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableItems!.count
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowItemSegue" {
            let cell = sender as! UITableViewCell
            if let indexPath = tableView.indexPath(for: cell) {
                let viewController = segue.destination as! ItemController
                viewController.loadViewIfNeeded()
                viewController.initStream(streamURL: tableItems![indexPath.row].1)
                tableView.deselectRow(at: indexPath, animated: true)
            }
        }
    }
    
    func initParts(items: [(String, String)]) {
        tableItems = items
    }
    
    
}
