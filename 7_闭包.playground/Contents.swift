//: Playground - noun: a place where people can play

import UIKit

//: 闭包表达式
let names = ["Chris","Alex","Ewa","Barry","Daniella"]
// >>>>> 1
func backward(_ s1: String, _ s2: String) -> Bool{
    return s1 > s2
}
var reverseNames_1 = names.sorted(by: backward)

// >>>>> 2
var reverseNames_2 = names.sorted { (s1: String, s2: String) -> Bool in
    return s1 > s2
}

// >>>>> 3
var reverseNames_3 = names.sorted(by: { s1, s2 in return s1 > s2 })


// >>>>> 4
var reveseNames_4 = names.sorted(by: { s1, s2 in s1 > s2 })


// >>>>> 5
var reverseNames_5 = names.sorted(by: { $0 > $1 })

// >>>>> 6
var reverseNames_6 = names.sorted(by: >)



//: 尾随闭包
// 尾随闭包是一个被书写在函数形式参数的括号外面（后面）的闭包表达式
func fetchMooshroomName(closure:() -> Void) {
    closure()
}
fetchMooshroomName(closure: {
    
})
var reverseNames_7 = names.sorted() { $0 > $1 }
var reverseNames_8 = names.sorted { $0 > $1 }
let digitNames = [
    0: "Zero",1: "One",2: "Two",  3: "Three",4: "Four",
    5: "Five",6: "Six",7: "Seven",8: "Eight",9: "Nine"
]
let numbers = [16,58,510]
let strings = numbers.map {
    (number) -> String in
    var number = number
    var output = ""
    repeat {
        output = digitNames[number % 10]! + output
        number /= 10
    } while number > 0
    return output
}
strings



//: 捕获值
struct CatchValue {
    static func makeIncrementer(forIncrement amount: Int) -> () -> Int {
        var runningTotal = 0
        func incrementer() -> Int {
            runningTotal += amount
            return runningTotal
        }
        return incrementer
    }
}
let incrementByTen = CatchValue.makeIncrementer(forIncrement: 10)
print(incrementByTen())
print(incrementByTen())
print(incrementByTen())
print(incrementByTen())


//: 闭包是引用类型
//


//: 逃逸闭包
// 非逃逸: 我们平时使用的Masonry 和 Snapkit的添加约束的方法是非逃逸的。因为闭包马上就执行了。
// 逃逸: 网络请求结束后的回调闭包则是逃逸的，因为发起请求后过了一段时间后这个闭包才执行。


//: 自动闭包