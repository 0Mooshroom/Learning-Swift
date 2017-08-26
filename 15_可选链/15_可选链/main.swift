//
//  main.swift
//  15_可选链
//
//  Created by 赵恒 on 2017/8/26.
//  Copyright © 2017年 Mooshroom. All rights reserved.
//

import Foundation
// 使用可选链调用的属性，方法都是返回的值都是可选类型
// 隐式返回的Void在可选链的调用下也是返回Void?所以可以用是否为nil来判断

//: 为可选链定义模型类
class Person {
    var residence: Residence?
}
class Residence {
    var rooms = [Room]()
    var numberOfRooms: Int {
        return rooms.count
    }
    subscript(_ index: Int) -> Room {
        get {
            return rooms[index]
        }
        set {
            rooms[index] = newValue
        }
    }
    func printNumberOfRooms() {
        print("The number of rooms is \(numberOfRooms)")
    }
    var address: Address?
}
class Room {
    var name: String
    init(name: String) { self.name = name }
}
class Address {
    var buildingName: String?
    var buildingNumber: String?
    var street: String?
    func buildingIdentifier() -> String? {
        if buildingName != nil {
            return buildingName
        } else if buildingNumber != nil && street != nil {
            return "\(buildingNumber) \(street)"
        } else {
            return nil
        }
    }
}



//: 通过可选链访问属性
let john = Person()
if let roomCount = john.residence?.numberOfRooms {
    print("John's residence has \(roomCount) room(s).")
} else {
    print("Unable to retrieve the number of rooms.")
}
func createAddress() -> Address {
    // 这个根本就不会走 因为residence没有初始化
    print("Function was called.")
    
    let somaAddress = Address()
    somaAddress.buildingNumber = "29"
    somaAddress.street = "chun shen"
    
    return somaAddress
}
john.residence?.address = createAddress()


