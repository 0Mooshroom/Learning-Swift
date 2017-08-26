//
//  main.swift
//  16_错误处理
//
//  Created by 赵恒 on 2017/8/26.
//  Copyright © 2017年 Mooshroom. All rights reserved.
//

import Foundation

//: 表示和抛出错误
// 在Swift中，错误表示为遵循Error协议类型的值。这个空的协议明确了一个类型可以用于处理

enum VendingMachineError: Error {
    case invalidSelection
    case insufficientFunds(coinsNeeded: Int)
    case outOfStock
}


//: 使用函数抛出函数传递错误
struct Item {
    var price: Int
    var count: Int
}
class VendingMachine {
    var inventory = [
        "Candy Bar": Item(price: 12, count: 7),
        "Chips": Item(price: 10, count: 4),
        "Pretzels": Item(price: 7, count: 1)
    ]
    var coinsDeposited = 0
    
    func vend(itemName name: String) throws {
        guard let item = inventory[name] else {
            throw VendingMachineError.invalidSelection
        }
        guard item.count > 0 else {
            throw VendingMachineError.outOfStock
        }
        guard item.price <= coinsDeposited else {
            throw VendingMachineError.insufficientFunds(coinsNeeded: item.price - coinsDeposited)
        }
        
        coinsDeposited -= item.price
        
        var newItem = item
        newItem.count -= 1
        inventory[name] = newItem
        
        print("Dispensing \(name)")
    }
}
let favoriteSnacks = [
    "Alice": "Chips",
    "Bob": "Licorice",
    "Eve": "Pretzels",
]
func buyFavoriteSnack(person: String, vendingMachine: VendingMachine) throws {
    let snackName = favoriteSnacks[person] ?? "Candy Bar"
    try vendingMachine.vend(itemName: snackName)
}



//: do-catch语句
var vendingMachine = VendingMachine()
vendingMachine.coinsDeposited = 10
do {
    try buyFavoriteSnack(person: "Alice", vendingMachine: vendingMachine)
} catch VendingMachineError.invalidSelection {
    print("Invalid Selection.")
} catch VendingMachineError.outOfStock {
    print("Out of Stock.")
} catch VendingMachineError.insufficientFunds(let coinsNeeded) {
    print("Insufficient funds. Please insert an additional \(coinsNeeded) coins.")
}



//: 转换错误为可选项
// 当你想要在同一句里处理所有错误时，使用 try?能让你的错误处理代码更加简洁
func getData() -> Data? {
    if let data  = try? fetchDataFromDisk() {
        return data
    }
    if let data = try? fetchDataFromServer() {
        return data
    }
    return nil
}
func fetchDataFromDisk() throws -> Data {
    return Data()
}
func fetchDataFromServer() throws -> Data {
    return Data()
}



//: 取消错误传递
// 比如说你已经知道一个抛出错误或者方法不会在运行时抛出错误。使用try!吧
let photo = try! loadImage("./Resources/JohnAppleseed.jpg")
func loadImage(url: String) throws -> UIImage? {
    return UIImage()
}
