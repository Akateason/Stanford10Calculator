//
//  NoteForClass3.swift
//  Stanford10Calculator
//
//  Created by teason23 on 2019/11/19.
//  Copyright © 2019 teason23. All rights reserved.
//

import UIKit

class NoteForClass3: NSObject {
    
/**
     1. Optional is just a enum
 enum Optional<T> {
     case none
     case some<T>
 }
*/
    
/**
2. Tuples
*/
    func funcTuples() {
//        let x: (String, Int, Double) = ("hello",4,0.43)  // type of x is a tuple
//        let (word, number, value) = x  // this names the tuple elements when accessing the tuple
//        print(word)
//        print(number)
//        print(value)
        
        let x: (w: String, i: Int, v: Double) = ("hello",5,.43)
        print(x.w)
        print(x.i)
        print(x.v)
    }
        
//    func getSize() -> (weight: Double, height: Double) {
//        return (250,50)
//    }
//    let x = getSize()
//    print("weight is \(x.weight)")
    
    
/**
     3. Range
     
     struct Range<T> {
        var startIndex: T
        var endIndex: T
     }
     
     "..<"  最后一个是小于
     "..."  两头等于
     let arr = ["a","b","c","d"]
     let a = arr[2...3]  // ['c','d']
     let b = arr[2..<3]  // ['c']
     
     for i in stride(from: 0.5, through: 15.23 by: 0.3) {
     // forin 浮点数
     }
*/
    
    
/**
     4. Data Structures
     Class, Struct and Enum
     相同点
     Declaration syntax ...
     Properties and Functions...
     Initializers (again, not enum) ... //除了枚举
     
     不同点
     inheritance (class only)
     Value Type (struct and enum) / Referrence Type(Class)
     
     
     Value vs. Reference
     ???
     
*/
    
    
/**
     5. Methods
     Parameters Names
     all parameters to all functions have an internal name and an external name.
     the internal name is the name of the local varible you use inside the method
*/
    func foo(externalFirst first: Int, externalSecond second: Double) {
        var sum = 0.0
        for _ in 0..<first {
            sum += second
        }
    }
    
    func bar() {
        let result = foo(externalFirst: 123, externalSecond: 5.5)
    }
    
    /**
     Double class
     static func abs(d: Double) -> Double {...}
     static var pi:Double {...}
     let d = Double.pi
     let d = Double.abs(-432.11)
     */
    

/**
     6. Properties
     Property Observers
     you can observe changes to any property with willSet and DidSet
     
     var someStoredProperty: Int = 42 {
        willSet { newValue //is the new value}
        didSet { oldValue //is the old value}
     }
     
     override var inheritedProperty: String {
        willSet { newValue //is the new value}
        didSet { oldValue //is the old value}
     }
     
     var operations: Dictionary<String, Operation> = [ ... ] {
        willSet { will be excuted if an operation is added/removed }
        didSet { will be excuted if an operation is added/removed }
     }
*/
    
    
    /**
     Lazy Initialization
     
     // 1 lazy var
     lazy var brain = CalculatorBrain()
     // 2 lazy var closure
     lazy var someProperty: Type = {
         // construct the value of someProperty here
         return <the constructed value>
     }
     // 3
     lazy var myProperty = self.initializeMyProperty()
     */
    
 
 /**
     7. Array
     
     var a = Array<String>()
     var a = [String]()
     
     var animals = ["cat", "dog", "bird"]
     animals.appends["fish"]
     
     for animal in animals {
        print(animal)
     }
*/
        
    func funcArray() {
        // 神奇的方法. 闭包作参数
        // 1. filter
        //filter(includeElement: (T) -> Bool) -> [T]
        let bigNumbers = [2,44,111,5,7].filter({ $0 > 20 })
        // bigNumbers = [44,111]
        
        // 2. map
        //map(transform: (T) -> U) -> [U]
        let stringified: [String] = [1,2,3].map{ String($0) }  // ["1","2","3"]
        
        // 3. reduce  聚合输出一个
        //reduce(initial: U, combine: (U, T) -> U) -> U
        let sum: Int = [1,2,3].reduce(0) { $0 + $1 } // 数组里的数字求和
        let sum = [1,2,3].reduce(0, +)  // 可这样写, 因为+在swfit中是一个方法
    }
    
    
/**
     8. Dictionary
     
     
*/
    
    
    
}
