//
//  ViewController.swift
//  RetroCalc
//
//  Created by Vignesh Ravichandran on 1/24/17.
//  Copyright © 2017 Vignesh Ravichandran. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    enum Operation: String {
        case Divide = "/"
        case Multiply = "*"
        case Subtract = "-"
        case Add = "+"
        case Empty = "Empty"
    }
    
    var currentOperation = Operation.Empty
    var runningNumber = ""
    var leftValStr = ""
    var rightValStr = ""
    var result = ""
    
    
    @IBOutlet weak var outputLbl: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
  
    @IBAction func numberPressed(_ sender: UIButton)
    {
        runningNumber += "\(sender.tag)"
        outputLbl.text = runningNumber
    }
    
    @IBAction func divPressed(operation: UIButton)
    {
        performingOperations(operation: Operation.Divide)
    }
    @IBAction func mulPressed(operation: UIButton)
    {
        performingOperations(operation: Operation.Multiply)
    }
    @IBAction func subPressed(operation: UIButton)
    {
        performingOperations(operation: Operation.Subtract)
    }
    @IBAction func addPressed(operation: UIButton)
    {
        performingOperations(operation: Operation.Add)
    }
    @IBAction func eqPressed(operation: UIButton)
    {
        performingOperations(operation: currentOperation)
    }
    @IBAction func clPressed(operation: UIButton)
    {
        runningNumber = ""
        rightValStr = ""
        leftValStr = ""
        result = ""
        currentOperation = Operation.Empty
        outputLbl.text = "0"
    }
    
    
    
    func performingOperations (operation:Operation)
    {
        if currentOperation != Operation.Empty {
            //A user selected an operator, but then selected another operator without first entering a number
            if runningNumber != "" {
                rightValStr = runningNumber
                runningNumber = ""
                
                if currentOperation == Operation.Multiply {
                    result = "\(Double(leftValStr)! * Double(rightValStr)!)"
                } else if currentOperation == Operation.Divide {
                    result = "\(Double(leftValStr)! / Double(rightValStr)!)"
                } else if currentOperation == Operation.Subtract {
                    result = "\(Double(leftValStr)! - Double(rightValStr)!)"
                } else if currentOperation == Operation.Add {
                    result = "\(Double(leftValStr)! + Double(rightValStr)!)"
                }
                
                leftValStr = result
                outputLbl.text = result
            }
            
            currentOperation = operation
        } else {
            //This is the first time an operator has been pressed
            leftValStr = runningNumber
            runningNumber = ""
            currentOperation = operation
        }

        
    }
   
   
}

