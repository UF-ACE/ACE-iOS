//
//  ViewController.swift
//  TipCalculator
//
//  Created by Nicholas Miller on 10/26/15.
//  Copyright © 2015 BirdWIng. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var price: UITextField!
    @IBOutlet weak var tipPercent: UITextField!
    @IBOutlet weak var answer: UILabel!
    var priceNumber = ""
    var tipNumber = ""
    var finalTip = 0.0
    var whichText = "Price"
    
    var duration = 1.0
    var delay = 0.0
    var red = UIColor.redColor()
    var blue = UIColor.blueColor()
    var green = UIColor.greenColor()
    var yellow = UIColor.yellowColor()
    var cyan = UIColor.cyanColor()
    var options = UIViewAnimationOptions.CurveLinear
    var size : CGFloat = 0.0
    var xPos : CGFloat = 0.0
    var yPosPrice : CGFloat = 0.0
    var yPosTip : CGFloat = 0.0
    let coloredSquare = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        price.enabled = false
        tipPercent.enabled = false
        answer.enabled = false
        answer.hidden = true
        
    }
    
    override func viewDidAppear(animated: Bool) {
        makeSquare()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func switchTextBox(sender: AnyObject) {
        if (whichText == "Price") {
            whichText = "Tip"
            moveToTip()
        }
        else {
            whichText = "Price"
            moveToPrice()
        }
        
    }
    
    @IBAction func calculateTip(sender: AnyObject) {
        priceNumber = price.text!
        tipNumber = tipPercent.text!
        
        if (priceNumber != "" && tipNumber != "" && tipNumber != "0") {
            finalTip = Double(priceNumber)! * (Double(tipNumber)! / 100)
            answer.text = "Your tip is: " + "$" + String(finalTip)
            answer.hidden = false
        }
        
    }
    
    func addNumberToText(num: String) {
        if (whichText == "Price") {
            price.text = price.text! + num
            if (price.text == "0") {
                price.text = ""
            }
        }
        else {
            tipPercent.text = tipPercent.text! + num
            if (tipPercent.text == "0") {
                tipPercent.text = ""
            }
        }
    }
    
    @IBAction func addZero(sender: AnyObject) {
        addNumberToText("0")
    }
    @IBAction func addOne(sender: AnyObject) {
        addNumberToText("1")
    }
    @IBAction func addTwo(sender: AnyObject) {
        addNumberToText("2")
    }
    @IBAction func addThree(sender: AnyObject) {
        addNumberToText("3")
    }
    @IBAction func addFour(sender: AnyObject) {
        addNumberToText("4")
    }
    @IBAction func addFive(sender: AnyObject) {
        addNumberToText("5")
    }
    @IBAction func addSix(sender: AnyObject) {
        addNumberToText("6")
    }
    @IBAction func addSeven(sender: AnyObject) {
        addNumberToText("7")
    }
    @IBAction func addEight(sender: AnyObject) {
        addNumberToText("8")
    }
    @IBAction func addNine(sender: AnyObject) {
        addNumberToText("9")
    }
    @IBAction func deleteLast(sender: AnyObject) {
        priceNumber = price.text!
        tipNumber = tipPercent.text!
        
        if (whichText == "Price") {
            if (priceNumber != "") {
                priceNumber.removeAtIndex(priceNumber.endIndex.predecessor())
                price.text = priceNumber
            }
        }
        else {
            if (tipNumber != "") {
                tipNumber.removeAtIndex(tipNumber.endIndex.predecessor())
                tipPercent.text = tipNumber
            }
        }
    }
    
    func makeSquare() {
        size = CGFloat(20)
        xPos = price.frame.origin.x - size - 10
        yPosPrice = price.frame.origin.y + 5
        yPosTip = tipPercent.frame.origin.y + 5
        
        coloredSquare.backgroundColor = self.green
        coloredSquare.frame = CGRectMake(xPos, yPosPrice, size, size)
        self.view.addSubview(coloredSquare)
        
    }
    
    func moveToTip() {
        UIView.animateWithDuration(duration, animations: {
            self.coloredSquare.backgroundColor = self.green
            
            // for the x-position I entered 320-50 (width of screen - width of the square). if you want, you could just enter 270
            self.coloredSquare.frame = CGRectMake(self.xPos, self.yPosTip, self.size, self.size)
            
            }, completion: { animationFinished in
                //            coloredSquare.removeFromSuperview()
        })
    }
    func moveToPrice() {
        UIView.animateWithDuration(duration, animations: {
            self.coloredSquare.backgroundColor = self.green
            
            // for the x-position I entered 320-50 (width of screen - width of the square). if you want, you could just enter 270
            self.coloredSquare.frame = CGRectMake(self.xPos, self.yPosPrice, self.size, self.size)
            
            }, completion: { animationFinished in
                //            coloredSquare.removeFromSuperview()
        })
    }
}

