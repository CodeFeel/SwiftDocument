//
//  Animal.swift
//  swiftBase
//
//  Created by ios on 2022/3/8.
//

import UIKit

struct WC<Base> {
    var base: Base
    init(_ base: Base) {
        self.base = base
    }
}

protocol WCCompatiable {}

extension WCCompatiable {
    
    var wc: WC<Self> {
        set { }
        get { WC(self) }
    }
    static var wc: WC<Self>.Type {
        set {}
        get { WC<Self>.self }
    }
}


extension String: WCCompatiable { }
extension NSString: WCCompatiable { }

extension WC where Base: ExpressibleByStringLiteral {
    
    var numberCount: Int {
        4
    }
}


