//
//  ViewController.swift
//  test
//
//  Created by Nicholas Miller on 11/14/15.
//  Copyright © 2015 BirdWIng. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var slider: UISlider!
    var currentValue: Int = 50
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        currentValue = lroundf(slider.value)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
//    This is a built in alert to UIKit
    @IBAction func showAlert() {
        let message = "The value of the slider is now: \(currentValue)"
        
//        let alert = UIAlertController(title: "Hello, iOS Workshop", message: "Is this part 2?", preferredStyle: .Alert)
        let alert = UIAlertController(title: "Hello, iOS Workshop", message: message, preferredStyle: .Alert)
        
        let action1 = UIAlertAction(title: "No", style: .Destructive, handler: nil)
        let action2 = UIAlertAction(title: "Yes", style: .Default, handler: nil)
        
        alert.addAction(action1)
        alert.addAction(action2)
        
        presentViewController(alert, animated: true, completion: nil)
        
    }
    
//    A simple action (method) with a UISloder being sent into it
    @IBAction func sliderMoved(slider: UISlider) {
//        print("The value of the slider is now: \(slider.value)")
        currentValue = lroundf(slider.value)
    }


}

