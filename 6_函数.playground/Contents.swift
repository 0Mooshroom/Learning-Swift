//: Playground - noun: a place where people can play

import UIKit

//: 可选元组返回类型
func minMax(array: [Int]) -> (min: Int, max: Int)? {
    if (array.isEmpty) { return nil }
    var currentMin = array[0]
    var currentMax = array[0]
    for value in array[1..<array.count] {
        if value < currentMin {
            currentMin = value
        } else if value > currentMax {
            currentMax = value
        }
    }
    return (currentMin, currentMax)
}

if let bounds = minMax(array: [-9, 0, 12, 9, -1, -100, 122]) {
    print("min: \(bounds.min), max: \(bounds.max)")
}



//: 形式参数标签
func modality(firstParamters: Int, secondParamters: Int) {
    //
}
modality(firstParamters: 2, secondParamters: 1)



//: 实际参数标签
func practice(first firstParamters: Int, second secondParamters: Int) {
    //
}
practice(first: 2, second: 1)



//: 省略实际参数标签
func ignorePractice(_ firstParamters: Int, _ secondParamters: Int) {
    //
}
ignorePractice(2, 1)



//: 默认形式参数值
func defaultModality(first: Int = 12) {
    
}
defaultModality()
defaultModality(first: 13)



//: 可变形式参数
func variableModality(numbers: Double...) {
    //
}
variableModality(numbers: 2, 3.3, 2.4, 3.0)



//: 输入输出形式参数
var a = 1, b = 2
func swapTwoInts(_ a: inout Int, _ b: inout Int) {
    (a, b) = (b, a)
}
swap(&a, &b)
print(a, b)



//: *使用函数类型
func addTwoInts(_ a: Int, _ b: Int) -> Int {
    return a + b
}
var mathFunction: (Int, Int) -> Int = addTwoInts
mathFunction(1, 2)



//: *函数类型做为形式参数类型
func printResult(_ mathFunction: (Int, Int) -> Int, _ a: Int, _ b: Int) {
    print("Result: \(mathFunction(a, b))")
}
printResult(addTwoInts, 3, 5)



//: 函数类型作为返回值
func stepForward(_ input: Int) -> Int {
    return input + 1
}
func stepBackward(_ input: Int) -> Int {
    return input - 1
}
func chooseSetupFunction(backwards: Bool) -> (Int) -> Int {
    return backwards ? stepBackward : stepForward
}
var currentValue = 3
let moveNearerToZero = chooseSetupFunction(backwards: currentValue > 0)
print("Counting to zero: ")
while currentValue != 0 {
    print("\(currentValue)")
    currentValue = moveNearerToZero(currentValue)
}
print("zero!")



//: 内嵌函数
func chooseStepFunction_1(backward: Bool) -> (Int) -> Int {
    func stepForward_1(_ input: Int) -> Int {
        return input + 1
    }
    func stepBackward_1(_ input: Int) -> Int {
        return input - 1
    }
    return backward ? stepBackward_1 : stepForward_1
}
var currentValue_1 = -4
let moveNearerToZero_1 = chooseStepFunction_1(backward: currentValue_1 > 0)
print("Counting to zero: ")
while currentValue_1 != 0 {
    print("\(currentValue_1)")
    currentValue_1 = moveNearerToZero_1(currentValue_1)
}
print("zero!")





