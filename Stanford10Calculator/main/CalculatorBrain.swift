//
//  CalculatorBrain.swift
//  Stanford10Calculator
//
//  Created by teason23 on 2019/11/18.
//  Copyright © 2019 teason23. All rights reserved.
//

import Foundation
 



struct CalculatorBrain {
    
    mutating func addUnaryOperation(named symbol: String, _ operation: @escaping (Double) -> Double) {
        operations[symbol] = Operation.unaryOperation(operation)
    }
    
    
    //  私有变量 记录 当前结果
    private var accumulator: Double?
    
    // swift 强大的枚举 .
    // enum associate value !!!
    private enum Operation {
        case constant(Double)                               // 常数
        case unaryOperation((Double) -> Double)             // 一元 操作
        case binaryOperation((Double, Double) -> Double)    // 二元 操作
        case equals
    }
        
    /// 私有变量 Dictionary 记录所有 运算符号
    private var operations: Dictionary<String,Operation> = [
        "π" : Operation.constant(Double.pi),
        "e" : Operation.constant(M_E),
        "√" : Operation.unaryOperation(sqrt),
        "cos" : Operation.unaryOperation(cos) ,
        "±" : Operation.unaryOperation({ -$0 }),
        "×" : Operation.binaryOperation({ $0 * $1 }),
        "÷" : Operation.binaryOperation({ $0 / $1 }),
        "+" : Operation.binaryOperation({ $0 + $1 }),
        "-" : Operation.binaryOperation({ $0 - $1 }),
        "=" : Operation.equals
    ]
        
    /// 可变方法  运算
    /// - Parameter symbol: 运算符
    mutating func performOperation(_ symbol: String) {
        
        if let operation = operations[symbol] {
            switch operation {
            case .constant(let value):
                accumulator = value
            case .unaryOperation(let function):
                if accumulator != nil {
                    accumulator = function(accumulator!)
                }
            case .binaryOperation(let function):
                if accumulator != nil {
                    //struct自带 初始化结构体
                    pbo = PendingBinaryOperation(function: function, firstOperand: accumulator!)
                    accumulator = nil
                }
            case .equals:
                performBinaryOperation()
            }
        }
    }
    
    
    /// 点击等号  二元运算
    private mutating func performBinaryOperation() {
        if pbo != nil && accumulator != nil {
            accumulator = pbo!.perform(with: accumulator!)
            pbo = nil
        }
    }
    
    /// 私有变量 等待二元操作 结构体 (记录上个数字) 结构体不必设初值
    private var pbo: PendingBinaryOperation?
    
    ///等待二元操作 结构体 声明
    private struct PendingBinaryOperation {
        let function: (Double,Double) -> Double
        let firstOperand: Double
        
        func perform(with secondOperand: Double) -> Double {
            return function(firstOperand, secondOperand)
        }
    }
    
    
    mutating func setOperand(_ operand: Double) {
        accumulator = operand
    }
        
    /// result prop 只读
    var result: Double? {
        get {
            return accumulator
        }
    }
    
    
}
