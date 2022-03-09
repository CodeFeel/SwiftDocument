//
//  main.swift
//  Person
//
//  Created by ios on 2022/3/3.
//

import Foundation


struct Person {
    var x = 0
    var y = 0
    
}

extension Person {
    init(_ point: Person) {
        self.init(x: point.x, y: point.y)
    }
}

var pp = Person()
var p1 = Person(x: 1, y: 1)
var p2 = Person(x: 2)



//var names = ["prt", "hanin", "feisike", "yijiayi"]
//
//print(names.startIndex)
//
//print(names.endIndex)




//var age: Int? = 10
//age = 10
//age = nil
//age = .some(20)
//
//switch age {
//case let v?:
//    print("1",v)
//case nil:
//    print("nil")
//}


//switch age {
//case .none:
//    print("none")
//case .some(""):
//    print("")
//}



//func testInt(_ num: Int) {
//    if num < 10 {
//        fatalError("ssss")
//
//    }
//    print("hhhhhhh")
//}
//
//testInt(2)


//class Stack<E> {
//
//    var elements = [E]()
//
//    func push(_ element: E) {
//        elements.append(element)
//    }
//
//    func pop() -> E {
//        elements.removeLast()
//    }
//
//    func top() -> E {
//        elements.last!
//    }
//
//    func size() -> Int {
//        elements.count
//    }
//
//}







//struct MyError: Error {
//    var msg: String
//}
//
//
//func divide(_ num1: Int, _ num2: Int) throws -> Int {
//
//    if num2 == 0 {
//        throw MyError(msg: "0有问题")
//    }
//    return num1
//}
//
//
//
//do {
//    var result = try divide(2, 0)
//}catch {
//    print("1",error)
//}

//class Person {
//    static var age = 0
//    static func run() {
//
//    }
//}
//
////Person.age = 10
////Person.run()
//Person.self.age = 10
//Person.self.run()



