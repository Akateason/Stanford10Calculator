//
//  ViewController.swift
//  Stanford10Calculator
//
//  Created by teason23 on 2019/11/14.
//  Copyright © 2019 teason23. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: PROPS
    
    /// 计算器model
    private var brain = CalculatorBrain()
            
    /// 用户是否正在输入
    var userIsInTheMiddleOfTyping = false
                    
    /// 输出值 , 包了getter setter
    var displayValue: Double {
        get {
            return Double(display.text!)!
        }
        set {
            display.text = String(newValue)
        }
    }
    
    /// UI label
    @IBOutlet weak var display: UILabel!
    
            
    
    // MARK: FUNCS
    
    /// 点击数字
    /// - Parameter sender: button
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
    
    /// 点击运算符
    /// - Parameter sender: button    
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
    
    
    // MARK: LIFE
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // cls6 处理循环引用.
        brain.addUnaryOperation(named: "✅") { [unowned self] in
            self.display.textColor = UIColor.green
            return sqrt($0)
        }
    }
    
    
}

