//
//  main.swift
//  18_协议
//
//  Created by 赵恒 on 2017/8/26.
//  Copyright © 2017年 Mooshroom. All rights reserved.
//

import Foundation

//: 协议的语法
protocol SomeProtocol {
    // .....
}



//: 属性要求 必须是var 可读{get} 可读写{get set}
protocol SomeProtocol1 {
    var mustBeSettable: Int { get set }
    var doseNotNeedToBeSettable: Int { get }
}
// static class（可以被子类继承）
protocol AnotherProtocol {
    static var someTypeProperty: Int { get set }
}
protocol FullyNamed {
    var fullName: String { get }
}
struct Person: FullyNamed {
    var fullName: String
}
class StarShip: FullyNamed {
    var prefix: String?
    var name: String
    init(name: String, prefix: String? = nil) {
        self.name = name
        self.prefix = prefix
    }
    var fullName: String {
        return (prefix != nil ? prefix! + " ": "") + name
    }
}
var ncc1701 = StarShip(name: "Enterprise", prefix: "USS")
print(ncc1701.fullName)



// 异变方法要求 在协议里的方法前面加上mutating
protocol Togglable {
    mutating func toggle()
}
enum OnOffSwitch: Togglable {
    case on, off
    mutating func toggle() {
        switch self {
        case .off:
            self = .on
        case .on:
            self = .off
        }
        print("current is \(self)")
    }
}
var lightSwitch = OnOffSwitch.off
lightSwitch.toggle()
lightSwitch.toggle()



//: 将协议作为类型
protocol RandomNumberGenerator {
    func random() -> Double
}
class LinearCongruentialGenerator: RandomNumberGenerator {
    var lastRandom = 42.0
    let m = 139968.0
    let a = 3877.0
    let c = 29573.0
    func random() -> Double {
        lastRandom = ((lastRandom * a + c).truncatingRemainder(dividingBy: m))
        return lastRandom / m
    }
}
class Dice {
    let sides: Int
    let generator: RandomNumberGenerator
    init(sides: Int, generator: RandomNumberGenerator) {
        self.sides = sides
        self.generator = generator
    }
    func roll() -> Int {
        return Int(generator.random() * Double(sides)) + 1
    }
}
var d6 = Dice(sides: 6, generator: LinearCongruentialGenerator())
for _ in 1...5 {
    print("Random dice roll is \(d6.roll())")
}
