//
//  main.swift
//  11_方法
//
//  Created by Mooshroom on 2017/8/25.
//  Copyright © 2017年 Mooshroom. All rights reserved.
//

import Foundation

//: 方法是关联了特定类型的函数。类，结构体，枚举都可以定义实例方法
class Counter {
    var count = 0;
    func increment() {
        count += 1
    }
    func increment(by amount: Int) {
        count += amount
    }
    func reset() {
        count = 0
    }
}
let counter = Counter()
counter.increment()
counter.increment(by: 2)
print(counter.count)
counter.reset()
print(counter.count)



//: self属性 普通的函数调用中是不需要写的系统可以判断，但是在你的函数的形式参数和你的类的属性相同的时候self就派上用场了。
struct Point {
    var x = 0.0, y = 0.0
    func isToTheRightOf(x: Double) -> Bool {
        return self.x > x
    }
}



//: 在实例方法中修改值类型 
// 通常我们都知道结构体和枚举都是值类型，类是引用类型，所以在结构体和枚举的实例方法中修改属性需要用到mutating
struct Mooshroom {
    var name = "moo", age = 25
//    func replaceName(name: String, age: Int) {
//        self.name = name    // 报错 Cannot assign to property: 'self' is immutable
//    }
    // 这样就不会报错啦
    mutating func replaceName(name: String, age: Int) {
        self.name = name        // 这样就不会报错啦
        self.age = age
    }
}



//: 异变方法里指定自身
struct Mooshroom1 {
    var name = "moo", age = 25
    mutating func replaceName(name: String, age: Int) {
        self = Mooshroom1(name: name, age: age)
    }
}
enum TriStateSwitch {
    case off, low, high
    mutating func next() {
        switch self {
        case .off:
            self = .low
        case .low:
            self = .high
        case .high:
            self = .off
        }
    }
}
var ovenLight = TriStateSwitch.low
ovenLight.next()
ovenLight.next()
ovenLight.next()



