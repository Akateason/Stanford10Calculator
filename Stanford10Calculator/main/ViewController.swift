//
//  ViewController.swift
//  Stanford10Calculator
//
//  Created by teason23 on 2019/11/14.
//  Copyright © 2019 teason23. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var display: UILabel!
    
    var userIsInTheMiddleOfTyping = false
            
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // cls6 处理循环引用.
        brain.addUnaryOperation(named: "✅") { [unowned self] in
            self.display.textColor = UIColor.green
            return sqrt($0)
        }
    }
    
    
    @IBAction func touchDigit(_ sender: UIButton) {
        // !来解包一个optionnal类型的值.
        let digit = sender.currentTitle!
        print("\(digit) was called")
        
        if userIsInTheMiddleOfTyping {
            // appending
            let textCurrentlyInDisplay = display.text!
            display.text = textCurrentlyInDisplay + digit
        }
        else {
            //first time typing
            display.text = digit
            userIsInTheMiddleOfTyping = true
        }
    }
    
    var displayValue: Double {
        get {
            return Double(display.text!)!
        }
        set {
            display.text = String(newValue)
        }
    }
    
    private var brain = CalculatorBrain()
    
    @IBAction func performOperation(_ sender: UIButton) {
        if userIsInTheMiddleOfTyping {
            brain.setOperand(displayValue)
            userIsInTheMiddleOfTyping = false
        }
                        
        if let mathematicalSymbol = sender.currentTitle {
            brain.performOperation(mathematicalSymbol)
        }
        
        if let result = brain.result {
            displayValue = result
        }
    }

}

