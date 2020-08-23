//
//  ViewController.swift
//  Calculator
//
//  Created by Chuong Nguyen on 6/26/20.
//  Copyright © 2020 chuongnguyen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var displayNum: UILabel! {
        didSet {
            displayNum.text = "0"
        }
    }
    var firstNumberStr: String = ""
    var secondNumberStr: String = ""
    var numDigit: Int = 0
    var operation: String = ""
    var previousTag: String = ""

    var isFirstNum: Bool = true
    var operationPerformed: Bool = false
    @IBAction func buttons(_ sender: UIButton) {
        if let textLabel = sender.titleLabel?.text {
            if (isFirstNum && textLabel == "0") {
                displayNum.text = "0"
                print("true")
            }
            switch textLabel {
            case "x", "-", "+", "÷":
                if operationPerformed {
                    return
                }
                operation = textLabel
                isFirstNum = false
                operationPerformed = true
                displayNum.text = operation
                break
            case "=":
                if isFirstNum {
                    return
                        
                }
                isFirstNum = true
                operationPerformed = false
                let result = calculate()
                
                displayNum.text = String(result)
                break
            default:
                if isFirstNum {
                    if displayNum.text == "0" {
                        displayNum.text = ""
                    }
                    firstNumberStr += textLabel
                    displayNum.text = firstNumberStr
                }
                else {
                    secondNumberStr += textLabel
                    displayNum.text = secondNumberStr
                }
            }
        }
        
    }
    
    func calculate() -> Double {
        let firstNum = Double(firstNumberStr)!
        let secondNum = Double(secondNumberStr)!
        var result = 0.0
        secondNumberStr = ""
        switch operation {
        case "x":
            result = firstNum * secondNum
        case "+":
            result = firstNum + secondNum
        case "-":
            result = firstNum - secondNum
        case "÷":
            result = firstNum / secondNum
            result = Double(round(result * 1000) / 1000)
        default:
            result = 0.0
        }
        
        firstNumberStr = "\(result)";
        return result;
    }
    
    
    
    
    @IBAction func reverse(_ sender: UIButton) {
        let num = Double(displayNum.text!)!
        let result = num * (-1.0)
        displayNum.text = String(result)
        
    }
    
    @IBAction func clear(_ sender: UIButton) {
        firstNumberStr = ""
        secondNumberStr = ""
        operation = ""
        displayNum.text = "0"
        operationPerformed = false
        isFirstNum = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    
}

