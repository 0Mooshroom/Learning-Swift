//: Playground - noun: a place where people can play
//: 基础内容

import UIKit


//: 介绍
let int: Int = 1
let double: Double = 1.20
let float: Float = 1.20
let bool: Bool = true
let string: String = "Mooshroom"
var option_string: String? = nil


//: let 声明常量 var 声明变量
let moo_age = 25
var moo_gender = "男"


//: 一次声明多个常量或者变量
let moo_name = "Mooshroom", moo_address = "Minecraft", moo_weight = 200
var moo_legs = 4, moo_nickname = "moo moo"


//: 一次声明多个相关变量的类型
var red, green, yellow, blue: Double


//: 打印 print(_:separator:terminator:)
let moo_friendlyName = "Bull"
print("Mooshroom's friendlyName is \(moo_friendlyName).")


//: 可以用min和max属性来访问每个证书类型的最小值和最大值
let minUInt8 = UInt8.min
let maxUInt8 = UInt8.max

let minInt8 = Int8.min
let maxInt8 = Int8.max

let minUInt16 = UInt16.min
let maxUInt16 = UInt16.max

let minInt16 = Int16.min
let maxInt16 = Int16.max

let minUInt32 = UInt32.min
let maxUInt32 = UInt32.max

let minInt32 = Int32.min
let maxInt32 = Int32.max

let minUInt64 = UInt64.min
let maxUInt64 = UInt64.max

let minInt64 = Int64.min
let maxInt64 = Int64.max

let minInt = Int.min
let maxInt = Int.max

let minUInt = UInt.min
let maxUInt = UInt.max

let m_double: Double = 1.012345678901234567890  //: 15位精度 推荐使用
let m_float: Float = 1.012345678901234567890    //: 6位精度


//: 类型安全与类型推断
let me_age = 25;
type(of: me_age);

let me_weight = 72.0
type(of: me_weight)

let me_cost = 5 + 15.5 + 12.5
type(of: me_cost)


//: 数值型字面量
//: 十进制（none）二进制（0b）八进制（0o）十六进制（0x）
let seventeen_10 = 17
let seventeen_2 = 0b10001
let seventeen_8 = 0o21
let seventeen_16 = 0x11


//: 整数和浮点数转换
let three = 3
let pointOneFourOneFiveNine = 0.14159
//let pi = three + pointOneFourOneFiveNine
let pi = Double(three) + pointOneFourOneFiveNine

let integerPi = Int(pi)
let integerSlice = Int(0.9999999999999999) // 这个是0
let integerMax =   Int(0.99999999999999999)   // 这个会变成1（超过16位）（最后一位四舍五入）


//: 类型别名
typealias Mooshroom = Int
var moo_hair = Mooshroom.max


//: Bool值
let mooHasTail = true
if mooHasTail {
    print("Mooshroom has a tail")
} else {
    print("Mooshroom hasn't a tail")
}
// swift的安全机制阻止你使用一个非bool得值替换bool
let moohasEye = 1
//if moohasEye {  // 会报错
//
//}
if moohasEye == 1 { // 不会报错
    print("Mooshroom have eyes")
}


//: 元组
let http404Error = (404, "Not Found")
let (statusCode, statusMessage) = http404Error
print("The status code is \(statusCode)")
print("The status message is \(statusMessage)")
print("0 = \(http404Error.0), 1 = \(http404Error.1)")


let (justTheStatusCode, _) = http404Error
print("The just status code is \(justTheStatusCode)")

let http200Status = (statusCode: 200, describe: "Success")
http200Status.statusCode
http200Status.describe



//: 可选值
// 这里有一个值X 或者这里根本没有值
//let possibleNumber = "123"
let possibleNumber = "abc"
let convertedNumber = Mooshroom(possibleNumber)
type(of: convertedNumber)



//: nil
// nil 不能用于非可选的常量或者变量
var serverResponseCode: Int? = 404
serverResponseCode = nil
type(of: serverResponseCode)



//: if语句的强制展开（拆包）
if convertedNumber != nil {
    // convertedNumber = Optional(123)
    print("convertedNumber = \(convertedNumber)")
}
if convertedNumber != nil {
    // convertedNumber = 123
    print("convertedNumber = \(convertedNumber!)")
}



//: 可选项绑定
if let actualNubmer = Mooshroom(possibleNumber) {
    print("\(possibleNumber) has an integer value of \(actualNubmer)")
} else {
    print("\(possibleNumber) could not be converted to an integer")
}
// 如果逗号前后有一个表达式不满足条件就会走到else 相当于&&和嵌套if语句
if let firstNumber = Mooshroom("4"),
    let secondNumber = Mooshroom("3"),
    firstNumber < secondNumber,
    secondNumber < 100 {
    print("\(firstNumber) < \(secondNumber) < 100")
} else {
    print("false")
}



//: 隐式展开可选项
let possibleString: String? = "An optional string"
let forcedString: String = possibleString!
// ↓↓↓↓↓↓↓
let assumedString: String! = "An implicitly ..... "
let implicitlyString: String = assumedString



//: 错误处理
// 在程序执行阶段，你可以使用错误处理机制来为错误状况负责
// 错误处理机制能允许你判断错误的形成原因
// 当一个函数遇到错误情况，他会抛出一个错误，这个函数访问者会捕捉到这个错误，并作出合适的反应
func canThrowAnError() throws {
    
}
// 使用
do {
    try canThrowAnError()
} catch {
    
}
// catch 分支 伪代码
/*
do {
    try makeASandwich()
} catch Error.OutofCleanDishes {
    
} catch Error.MissingIngredients(igredients: String) {
    
}
*/



//: 断言 调试
let age = -3
//assert(age >= 0, "A person's age cannot be less than zero")

if age > 10 {
    
} else if age > 0 {
    
} else {
    assertionFailure("A person's age cannot be less than zero")
}








