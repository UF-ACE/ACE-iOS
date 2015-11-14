//
//  CheckListViewController.swift
//  test
//
//  Created by Nicholas Miller on 11/14/15.
//  Copyright © 2015 BirdWIng. All rights reserved.
//

import UIKit

class CheckListViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
//    This is not the number of cells but the number of rows
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
//    This is where we set the attributes of each cell after we see how many rows exist in each cell
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("ChecklistItem")! as UITableViewCell
        let label = cell.viewWithTag(1000) as! UILabel
        
        if indexPath.row % 5 == 0 {
            label.text = "Watch iOS part 1"
        }
        else if indexPath.row % 5 == 1 {
            label.text = "Watch Android part 1"
        }
        else if indexPath.row % 5 == 2 {
            label.text = "Watch iOS part 2"
        }
        else if indexPath.row % 5 == 3 {
            label.text = "Watch Android part 2"
        }
        else if indexPath.row % 5 == 4 {
            label.text = "Say hi to Nick"
        }
            
        return cell
    }
    
//    This is our method when a cell is selected
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
            if let cell = tableView.cellForRowAtIndexPath(indexPath) {
                if cell.accessoryType == .None {
                    cell.accessoryType = .Checkmark
                }
                else {
                    cell.accessoryType = .None
                }
            }
            
            tableView.deselectRowAtIndexPath(indexPath, animated: true)
    }

}
