//
//  main.swift
//  14_初始化
//
//  Created by 赵恒 on 2017/8/25.
//  Copyright © 2017年 Mooshroom. All rights reserved.
//

import Foundation

//: 初始化 init()
struct Fahrenheit {
    var temperature: Double
    init() {
        temperature = 32.0
    }
}
var f = Fahrenheit()
print("The default temprature is \(f.temperature)")



//: 初始化形式参数
struct Mooshroom {
    var name: String
    
    init(name: String) {
        self.name = name
    }
}
let moo = Mooshroom(name: "moo")



//: 形式参数和实际参数标签和无实际参数
struct Color {
    let red, green, blue: Double
    init(red: Double, green: Double, blue: Double) {
        self.red = red
        self.green = green
        self.blue = blue
    }
    init(white: Double) {
        red = white
        green = white
        blue = white
    }
    init(_ red: Double) {
        self.red = red
        green = 0.0
        blue = 0.0
    }
}
let color = Color(red: 1, green: 0.1, blue: 0.2)
let halfGray = Color(white: 0.5)
let red = Color(0.5)



//: 可选值类型
class Moo {
    var name: String
    var age: UInt? {
        willSet {
            if let newAge = newValue {
                print("I am \(newAge)")
            }
        }
    }
    init(name: String) {
        self.name = name
    }
    func ask() {
        print("\(name) How old are you?")
    }
}
let m = Moo(name: "Moo")
m.ask()
m.age = 25



//: 指定初始化器和便捷初始化器
// 规则：
// 1. 指定初始化器必须从它的直系父类调用指定初始化器。
// 2. 便捷初始化器必须从相同的类里调用另一个初始化器。
// 3. 便捷初始化器最终必须调用一个指定初始化器。
class Food {
    var name: String
    init(name: String) {
        self.name = name
    }
    convenience init() {
        self.init(name: "[UnknowName]")
    }
}
class RecipeIngredient: Food {
    var quantity: Int
    init(name: String, quantity: Int) {
        self.quantity = quantity
        super.init(name: name)
    }
    override convenience init(name: String) {
        self.init(name: name, quantity: 1)
    }
}
class ShoppingListItem: RecipeIngredient {
    var purchased = false
    var description: String {
        var output = "\(quantity) x \(name)"
        output += purchased ? " ✔" : " ✘"
        return output
    }
}
var breakfastList = [
    ShoppingListItem(),
    ShoppingListItem(name: "Bacon"),
    ShoppingListItem(name: "Eggs", quantity: 6)
]
breakfastList[0].name = "Orange juice"
breakfastList[0].purchased = true
for item in breakfastList {
    print(item.description)
}
// 打印结果
/*
 1 x Orange juice ✔
 1 x Bacon ✘
 6 x Eggs ✘
 */



//: 可失败初始化器
// 初始化传入无效的形式参数值，或缺少某种外部所需的资源，又或是其他阻止初始化的情况 都需要使用可失败的初始化器
// 在init后面加?
struct Animal {
    let species: String
    init?(species: String) {
        if species.isEmpty { return nil }
        self.species = species
    }
}
let animal = Animal(species: "Cat")
if let tempAnimal = animal {
    print("tempAnimal.species = \(tempAnimal.species)")
}
let failure = Animal(species: "")
if failure == nil {
    print("Animal init failure.")
}



//: 初始化失败的传递
class Product {
    let name: String
    init?(name: String) {
        if name.isEmpty { return nil }
        self.name = name
    }
}
class CarItem: Product {
    let quantity: Int
    init?(name: String, quantity: Int) {
        if quantity < 1 { return nil }
        self.quantity = quantity
        super.init(name: name)
    }
}



