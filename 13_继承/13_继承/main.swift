//
//  main.swift
//  13_继承
//
//  Created by Mooshroom on 2017/8/25.
//  Copyright © 2017年 Mooshroom. All rights reserved.
//

import Foundation

//: 定义一个基类 任何不被其他类继承的类就是基类
class Vehicle {
    var currentSpeed = 0.0
    var description: String {
        return "traveling at \(currentSpeed) miles per hour"
    }
    func makeNoise() {
        print("Noise -  0")
    }
}
let someVehicle = Vehicle()
print(someVehicle.description)


//: 子类
class Bicyle: Vehicle {
    var hasBasket = false
}
let bicyle = Bicyle()
bicyle.hasBasket = true
bicyle.currentSpeed = 15.0
print(bicyle.description)



//: 子类的子类
class Giant: Bicyle {
    var autoTransmission = false;   // 自动变速
}
let giant = Giant()
giant.currentSpeed = 22.0
giant.hasBasket = false
print(giant.description)



//: 子类重写基类方法
class Roewe: Vehicle {
    override func makeNoise() {
        print("Noise -  22")
        super.makeNoise()
    }
}
let roewe = Roewe()
roewe.makeNoise()


// 阻止重写
// 可以通过标记为终点来阻止一个方法、属性或者下标脚本被重写。通过在方法、属性或者下标脚本的关键字前写 final 修饰符(比如 final var ， final func ， final class func ， fianl subscript )。
final class Final { // 不允许继承
    final func eat() {
        print("eat")
    }
}
class Final2: Final {   // 报错
    
}
