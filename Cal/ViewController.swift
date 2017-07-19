//
//  ViewController.swift
//  Cal
//
//  Created by JOHN KENNY on 19/09/2016.
//  Copyright © 2016 JOHN KENNY. All rights reserved.
//

import UIKit

enum modes
{
    case not_SET
    case addition
    case subtraction
    case multi
}

class ViewController: UIViewController {
    
    //varibles
    
    var labelString: String = "0"
    var currentMode:modes = modes.not_SET
    var savedNum: Int = 0
    var lastButtonWasMode: Bool = false

    
    @IBOutlet var display: UILabel!
    
    
    
    @IBAction func add(_ sender: AnyObject)
    {
        changeMode(modes.addition)
      
    }
    
    @IBAction func sub(_ sender: AnyObject)
    {
        changeMode(modes.subtraction)
    }
    
    
    @IBAction func multi(_ sender: AnyObject)
    {
        changeMode(modes.multi)
    }
    
    
    
    @IBAction func equals(_ sender: AnyObject)
    {
        guard let num:Int = Int(labelString)else
        {
            return
        }
        
        if currentMode == modes.not_SET || lastButtonWasMode
        {
            return
        }
        
        if currentMode == modes.addition
        {
            savedNum += num
        }
        else if currentMode == modes.subtraction
        {
            savedNum -= num
        }
        else if currentMode == modes.multi
        {
            savedNum *= num
        }
        
        currentMode = modes.not_SET
        labelString = "\(savedNum)"
        updateText()
        lastButtonWasMode = true
    }
    
    
    @IBAction func reset(_ sender: AnyObject)
    {
        labelString = "0"
        savedNum = 0
        display.text = "0"
        currentMode = modes.not_SET
        lastButtonWasMode = false
    }
    
    @IBAction func no0(_ sender: AnyObject) {tappedNum(0)
    }
    
    
    @IBAction func no1(_ sender: AnyObject) {tappedNum(1)
    }
    @IBAction func no2(_ sender: AnyObject) {tappedNum(2)
    }
    @IBAction func no3(_ sender: AnyObject) {tappedNum(3)
    }
    @IBAction func no4(_ sender: AnyObject) {tappedNum(4)
    }
    @IBAction func no5(_ sender: AnyObject) {tappedNum(5)
    }
    @IBAction func no06(_ sender: AnyObject) {tappedNum(6)
    }
    @IBAction func no7(_ sender: AnyObject) {tappedNum(7)
    }
    @IBAction func no8(_ sender: AnyObject) {tappedNum(8)
    }
    @IBAction func no9(_ sender: AnyObject) {tappedNum(9)
    }
    
    
    
    func tappedNum(_ no: Int)
    {
        if lastButtonWasMode
        {
            lastButtonWasMode = false
            labelString = "0"
        }
        labelString = labelString + "\(no)"
        updateText()
    }
    
    func updateText()
    {
        
        guard let val: Int = Int(labelString) else
        {
            labelString = "Invalid"
            return
        }
        if currentMode == modes.not_SET
        {
            savedNum = val
        }
        let format: NumberFormatter = NumberFormatter()
        format.numberStyle = NumberFormatter.Style.decimal
        
        let formatedNo: NSNumber = NSNumber(value: val as Int)
        display.text = format.string(from: formatedNo)
    }
    
    func changeMode(_ newMode: modes)
    {
        if savedNum == 0
        {
            return
        }
        
        currentMode = newMode
        lastButtonWasMode = true
        
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

