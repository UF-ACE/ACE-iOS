//
//  CheckListViewController.swift
//  test
//
//  Created by Nicholas Miller on 11/14/15.
//  Copyright © 2015 BirdWIng. All rights reserved.
//

import UIKit

class CheckListViewController: UITableViewController {
    
    // Add an item to this array to add more things to the todo list
    var arrayOfTodos = ["Say hi to Nick", "Watch iOS part 1", "Say hi to Sergio 😱", "Watch iOS part 2", "Watch Android part 2" ]
    var arrayOfDoneItems: [String] = []

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
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        // When preparing for the segue, have this view controller provide a closure for
        // onDataAvailable in the NewToDoItemViewController class
        if let viewController = segue.destinationViewController as? NewToDoItemViewController {
            // this funky syntax below is a swift closure
            // see: http://fuckingclosuresyntax.com/
            viewController.onDataAvailable = {[weak self]
                (data: String) in
                self?.arrayOfTodos.append(data)
                self?.tableView.reloadData()
            }
        }
    }
    
    
    override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0 {
            return "Stuff I need to do";
        }
        else {
            return "Stuff I did"
        }
    }
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // We want two sections, one for Items we need to do
        // and one for the items that are done
        return 2
    }
    
    
    // The number of rows in each section
    // Which is the size of each array holding our done items and items we need to do
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return arrayOfTodos.count;
        }
        else {
            return arrayOfDoneItems.count
        }
    }
    
//    This is where we set the attributes of each cell after we see how many rows exist in each cell
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        // create a cell!
        let cell = tableView.dequeueReusableCellWithIdentifier("ChecklistItem")! as UITableViewCell
        // get the label of the cell
        let label = cell.viewWithTag(1000) as! UILabel
        
        // indexPath.row is the row index of the this table view cell!
        let itemIndex = indexPath.row
        
        // Means it is in the "to do items" section
        if indexPath.section == 0 {
            label.text = arrayOfTodos[itemIndex];
            
//            If we wanted to directly assign text to a particular label
//            if (itemIndex == 0) {
//                label.text = "nick"
//            }
//            else if (itemIndex == 1) {
//                label.text = "miller"
//            }
        }
        // Otherwise, we are in the done section
        else {
            // Get the item from our list of 'done items'
            let item = arrayOfDoneItems[itemIndex]
            // Below I am creating a string with a 'strike through' in it
            // see: http://stackoverflow.com/questions/13133014/uilabel-with-text-struck-through
            let itemWithStrikethru = NSAttributedString(string: item, attributes: [NSStrikethroughStyleAttributeName: NSUnderlineStyle.StyleSingle.rawValue])
            label.attributedText = itemWithStrikethru
            cell.accessoryType = .None
        }

        
        return cell
    }
    
//    This is our method when a cell is selected
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
//            if let cell = tableView.cellForRowAtIndexPath(indexPath) {
//                if cell.accessoryType == .None {
//                    cell.accessoryType = .Checkmark
//                }
//                else {
//                    cell.accessoryType = .None
//                }
//            }
        
            // Means it is in the "to do items" section
            if indexPath.section == 0 {
                //cell.accessoryType = .Checkmark
                let itemIndex = indexPath.row
                // remove item from array of todos
                let doneItem = arrayOfTodos.removeAtIndex(itemIndex)
                // add it to the array of done items
                arrayOfDoneItems.append(doneItem)
                tableView.reloadData()
            }
            else {
                // Do nothing if tap a cell in the "done items" section
            }
        
            
            tableView.deselectRowAtIndexPath(indexPath, animated: true)
    }

}
