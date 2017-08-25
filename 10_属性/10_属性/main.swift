//
//  main.swift
//  10_属性
//
//  Created by 赵恒 on 2017/8/24.
//  Copyright © 2017年 Mooshroom. All rights reserved.
//

import Foundation

//: 存储属性
// 在其最简单的形式下，存储属性是一个作为特定类和结构体实例一部分的常量或变量。存储属性要么是变量存储属性（由 var  关键字引入）要么是常量存储属性（由 let  关键字引入）。
struct FixedLengthRange {
    var firstValue: Int
    let lenght: Int
}
var rangeOfThreeItems = FixedLengthRange(firstValue: 0, lenght: 3)
rangeOfThreeItems.firstValue = 6
print(rangeOfThreeItems.firstValue) // 6



//: 常量结构体实例的存储属性
// 如果你创建了一个结构体的实例并且赋值给一个常量，那么该实例的其他属性也是常量，不能进行修改
let rangeOfFourItems = FixedLengthRange(firstValue: 0, lenght: 4)
//rangeOfFourItems.firstValue = 7
print(rangeOfThreeItems.firstValue)
// 但是类可以



//: 延迟存储属性
class DataImporter {
    var fileName = "data.txt"
}

class DataManager {
    lazy var importer = DataImporter()
    var data = [String]()
}

let manager = DataManager()
manager.data.append("some data")
manager.data.append("some more data")
// 创建并使用importer
print(manager.importer.fileName)



//: 计算属性
// 它并不存储值,相反的是它能提供一个读取器和一个可选的设置其来间接的设置其他的属性和值
struct Point {
    var x = 0.0, y = 0.0
}
struct Size {
    var width = 0.0, height = 0.0
}
struct Rect {
    var origin = Point()
    var size = Size()
    var center: Point {
        get {
            let centerX = origin.x + (size.width / 2)
            let centerY = origin.y + (size.height / 2)
            return Point(x: centerX, y: centerY)
        }
        set {
            origin.x = newValue.x - (size.width / 2)
            origin.y = newValue.y - (size.height / 2)
        }
    }
}
var square = Rect(origin: Point(x: 0.0, y: 0.0), size: Size(width: 10.0, height: 10.0))
let initialSquareCenter = square.center
square.center = Point(x: 15.0, y: 15.0)
print(square.origin.x, square.origin.y)



//: 只读计算属性
struct Person {
    var firstName = "Moo"
    var lastName = "Shroom"
    var name: String {
        return firstName + lastName
    }
}
let moo = Person()
//moo.name = "123"   error: only-read
print("His name is \(moo.name)")




//: 属性观察者
// willset 会在该值被存储之前被调用
// didset 会在新值被存储后被调用
class StepCounter {
    var totalSteps: Int = 0 {
        willSet(newTotalSteps) {
            print("About to set totalSteps to \(newTotalSteps)")
        }
        didSet {
            if totalSteps > oldValue {
                print("Added \(totalSteps - oldValue) steps")
            }
        }
    }
}

let stepCount = StepCounter()
stepCount.totalSteps = 200
stepCount.totalSteps = 300
stepCount.totalSteps = 400



//: 全局变量
// 同样拥有 willSet 和 didSet
var name: String = "" {
    willSet {
        print("new " + newValue)
    }
    didSet {
        print("old " + oldValue)
    }
}

name = "1"
name = "2"




//: 类型属性
// 对于struct、enum 我们使用static来设置类型属性
// 对于class 我们使用static或者class来设置类型属性，class关键字允许子类重写父类的实现。
struct SomeStructure {
    static var storedTypeProperty = "some value"
    static var computedTypeProperty: Int {
        return 1
    }
}
enum SomEnumeration {
    static var storedTypeProperty = "some value"
    static var computedTypeProperty: Int {
        return 3
    }
}
class SomeClass {
    static var storedTypeProperty = "some value"
    static var computedTypeProperty: Int {
        return 7
    }
    class var overrideableComputedTypeProperty: Int {
        return 107
    }
}
class SubSomeClass: SomeClass {
    class override var overrideableComputedTypeProperty: Int {
        return 108
    }
}
print(SomeClass.overrideableComputedTypeProperty)
print(SubSomeClass.overrideableComputedTypeProperty)



