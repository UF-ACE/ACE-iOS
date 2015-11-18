//
//  ViewController.swift
//  test
//
//  Created by Nicholas Miller on 11/14/15.
//  Copyright © 2015 BirdWIng. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    var player: AVAudioPlayer = AVAudioPlayer()
    
    @IBOutlet weak var slider: UISlider!
    var currentValue: Int = 50
    
    @IBOutlet weak var onOffButton: UISwitch!
    
    var duration = 1.0
    var delay = 0.0
    var red = UIColor.redColor()
    var blue = UIColor.blueColor()
    var green = UIColor.greenColor()
    var yellow = UIColor.yellowColor()
    var cyan = UIColor.cyanColor()
    var options = UIViewAnimationOptions.CurveLinear
    var size : CGFloat = 0.0
    var xPos1 : CGFloat = 0.0
    var xPos2 : CGFloat = 0.0
    var yPos : CGFloat = 0.0
    let coloredSquare = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        currentValue = lroundf(slider.value)
        
        let audioPath = NSBundle.mainBundle().pathForResource("Audio/01 Hello", ofType: "m4a")
        var error:NSError? = nil
        do {
            player = try AVAudioPlayer(contentsOfURL: NSURL(fileURLWithPath: audioPath!))
        }
        catch {
            print("Something bad happened. Try catching specific errors to narrow things down")
        }
        
    }
    
    override func viewDidAppear(animated: Bool) {
        makeSquare()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
//    This is a built in alert to UIKit
    @IBAction func showAlert() {
        let message = "The value of the slider is now: \(currentValue) \n How many times did I call?"
        
//        let alert = UIAlertController(title: "Hello, iOS Workshop", message: "Is this part 2?", preferredStyle: .Alert)
        let alert = UIAlertController(title: "Hello, it's me...", message: message, preferredStyle: .Alert)
        
        let action1 = UIAlertAction(title: "None", style: .Destructive, handler: nil)
        let action2 = UIAlertAction(title: "1000", style: .Default, handler: nil)
        
        alert.addAction(action1)
        alert.addAction(action2)
        
        player.play()
        
        presentViewController(alert, animated: true, completion: nil)
        
    }
    
    @IBAction func stopMusic(sender: UIButton) {
        player.stop()
    }
//    A simple action (method) with a UISloder being sent into it
    @IBAction func sliderMoved(slider: UISlider) {
//        print("The value of the slider is now: \(slider.value)")
        currentValue = lroundf(slider.value)
    }
    
    
    @IBAction func onOffButtonClicked(sender: UISwitch) {
        if (onOffButton.on == true) {
            moveSquare("right")
//            onOffButton.on = false
        }
        if (onOffButton.on == false) {
            self.coloredSquare.backgroundColor = self.yellow
            moveSquare("left")
            //            onOffButton.on = false
        }
    }
    
    func makeSquare() {
        size = CGFloat(20)
        xPos1 = CGFloat(0)
        xPos2 = CGFloat(self.view.frame.width - 20)
        yPos = CGFloat(3*(self.view.frame.height/4))
        
        coloredSquare.backgroundColor = self.green
        coloredSquare.frame = CGRectMake(xPos1, yPos, size, size)
        self.view.addSubview(coloredSquare)
        
    }
    
    func moveSquare(way: String) {
        
        if (way == "right") {
            UIView.animateWithDuration(duration, animations: {
                self.coloredSquare.backgroundColor = self.blue
                self.coloredSquare.frame = CGRectMake(self.xPos2, self.yPos, self.size, self.size)
                }, completion: { animationFinished in
//                    self.coloredSquare.removeFromSuperview()
            })
        }
        else if (way == "left") {
            UIView.animateWithDuration(duration, animations: {
                self.coloredSquare.backgroundColor = self.red
                self.coloredSquare.frame = CGRectMake(self.xPos1, self.yPos, self.size, self.size)
                }, completion: { animationFinished in
//                    self.coloredSquare.removeFromSuperview()
            })
        }
        
    }


}

