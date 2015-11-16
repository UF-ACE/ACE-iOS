//
//  NewToDoItemViewController.swift
//  test
//
//  Created by Sergio Puleri on 11/16/15.
//  Copyright © 2015 BirdWIng. All rights reserved.
//

import Foundation
import UIKit

class NewToDoItemViewController: UIViewController, UITextViewDelegate {
    
    // Optional closure to be implemented by the CheckListViewController
    // See: http://stackoverflow.com/questions/24318480/passing-data-in-swift for more info
    var onDataAvailable : ((data: String) -> ())?
    
    // Linking the textview containing the new item text
    @IBOutlet weak var newItemText: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.newItemText.text = ""
        // The below 2 lines basically set the 'focus' to the textview in this view
        // When the view loads the keyboard will be up and cursor will be active, waiting for you to type
        self.newItemText.delegate = self
        self.newItemText.becomeFirstResponder()
    }
    
    func sendData(data: String) {
        // Whenever you want to send data back to CheckListViewController, check
        // if the closure is implemented and then call it if it is
        self.onDataAvailable?(data: data)
    }
    
    
    @IBAction func cancelPressed() {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBAction func addPressed(sender: AnyObject) {
        // If text view string is not empty
        if self.newItemText.text.characters.count > 0 {
            // Send this string to the CheckListViewController
            sendData(self.newItemText.text)
            self.newItemText.text = ""
            self.dismissViewControllerAnimated(true, completion: nil)
        }
        
    }
    
    
    
}