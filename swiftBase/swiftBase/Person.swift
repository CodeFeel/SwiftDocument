//
//  Person.swift
//  swiftBase
//
//  Created by ios on 2022/3/8.
//

import UIKit

class Person: NSObject {

    @objc dynamic var age : Int = 10
    
    
    deinit {
        print("person deinit")
    }
}
