//: Playground - noun: a place where people can play

import UIKit

enum SomeEnumeration {
    
}

enum CompassPoint {
    case north
    case south
    case east
    case west
}

CompassPoint.north.hashValue
CompassPoint.south.hashValue



//: 关联值
enum Barcode {
    case upc(Int, Int, Int, Int)
    case qrCode(String)
}
var productBarcode = Barcode.upc(8, 8009, 8225, 000)
productBarcode = Barcode.qrCode("ABCDEFGHIJKLMNOPQRSTUVWXYZ")
switch productBarcode {
case .upc (let a, let b, let c, let d):
    print("\(a), \(b), \(c), \(d)")
case .qrCode (let a):
    print("\(a)")
}


//: 原始值
enum ASCIIControlCharacter: Character {
    case tab = "\t"
    case lineFeed = "\n"
    case carriageReturn = "\r"
}
enum RequestAPI: String {
    case UserLogin = "/proxy/login"
    case UserReigst = "/proxy/regist"
    case UserLogout = "/proxy/logout"
}
RequestAPI.UserLogin.rawValue


//: 隐式指定原始值
enum Planet: Int {
    case mercury = 1, venus, earth, mars, jupiter, saturn, uranus, neptune
}
enum CompassPoint1: String {
    case north1, south1, east1, west1
}


//: 从原始值初始化
let north1 = "north1"
if let diretion = CompassPoint1.init(rawValue: north1) {
    switch diretion {
    case .north1:
        print("north1")
    default:
        print("default")
    }
}



//: 递归枚举
indirect enum ArithmeticExpression {
    case number(Int)
    case addition(ArithmeticExpression, ArithmeticExpression)
    case multiplication(ArithmeticExpression, ArithmeticExpression)
}
let five = ArithmeticExpression.number(5)
let four = ArithmeticExpression.number(4)
let sum = ArithmeticExpression.addition(five, four)
let product = ArithmeticExpression.multiplication(sum, ArithmeticExpression.number(2))

func evalute(_ expression: ArithmeticExpression) -> Int {
    switch expression {
    case let .number(value):
        return value
    case let .addition(left, right):
        return evalute(left) + evalute(right)
    case let .multiplication(left, right):
        return evalute(left) * evalute(right)
        
    }
}
print("result: \(evalute(product))")






