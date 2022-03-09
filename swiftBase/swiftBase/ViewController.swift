
//:
/*
 编译器：swift       OC
 前端：swiftc      Clang
 后端：LLVM        LLVM
 Swift code --> Swift AST(语法树) -->Raw Swift IL --> Canonical Swift IL --> LLVM IR --> Assembly --- Excutable
 */


/*:
 值类型：
 >枚举： Optional
 >结构体：Int Float Double Bool Character String Array Dictionary Set
 
 引用类型： 类
 */

import UIKit






class ViewController: UIViewController {
    
    var name = "Hanin"
    
    var age = 10
    
    var pwd = Password.winter
    //
    var season = Season.spring
    
    var editor = Editor.label
    
    var person = Person()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.white
        title = "swift基础"
        
//        person.addObserver(self, forKeyPath: "age", options: .new, context: nil)
//
//        person.age = 19
        

        testMapAndFlatMap()
        
        
    }
    
//    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
//        print("observeValue",change)
//    }
    
    
    
    
}

/// 区间
extension ViewController {
    
    
    
    private func rangeTest() {
        
        //        let range1: ClosedRange<Int> = 1...3
        //        let range2: Range<Int> = 1..<3
        //        let range3: PartialRangeThrough<Int> = ...4
        //        for i in range2 {
        //            print(i)
        //        }
        
        /*
         带间隔的区间值
         from
         through
         by
         */
        for tick in stride(from: 4, through: 12, by: 2) {
            print(tick)
        }
        testArray(aa: 10)
    }
    
    
    /// dewe
    /// - Parameter ee: ewe
    func testArray(_ ee: Int = 10,  aa: Int, _ dd: Int = 20) {
        
    }
}
///========================================================

/// inout 输入输出参数
extension ViewController {
    
    struct Shape {
        var width: Int
        
        var side: Int {
            willSet {
                print("willSetSide", newValue)
            }
            didSet {
                print("didSetSide", oldValue, side)
            }
        }
        
        var girth: Int {
            set {
                width = newValue / side
                print("setGirth", newValue)
            }
            get {
                print("getGirth")
                return width * side
            }
        }
        
        func show() {
            print("width=\(width), side=\(side), girth=\(girth)")
        }
        
    }
    
    func swapValues(_ v1: inout Int, _ v2: inout Int) {
        (v1, v2) = (v2, v1)
    }
    
    func testNumber(_ num: inout Int) {
        print("test")
        num = 22
    }
    
    func testInoutSample() {
        
        var shape = Shape(width: 10, side: 2)
        testNumber(&shape.width)
        //        shape.show()
        
        //        testNumber(&shape.side)
        //        shape.show()
        
        //        testNumber(&shape.girth)
        //        shape.show()
    }
}
///========================================================

/// 函数重载：函数名相同  参数个数不同、参数类型不同、参数标签不同
extension ViewController {
    
    func sum(_ v1: Int, _ v2: Int) {
        
    }
    
    func sum(_ v1: Int, _ v2: Int, _ v3: Int) {
        
    }
}

///========================================================

/// 关联值 多一个字节用来存储成员值
enum Password {
    case number(Int, Int, Int)
    case other(Int,Int,Int,Int)
    case winter
}

/// 原始值
enum Season {
    case spring, sunmmer, autumn, winter
}

/// 原始值
enum Editor: Int {
    case label = 3
    case hor = 4
    case ver = 5
}

extension ViewController {
    
    /// 查看枚举内存
    func testVemory() {
        print(Mems.ptr(ofVal: &pwd))
        pwd = .number(1, 3, 5)
        pwd = .winter
        pwd = .other(2, 12, 22, 42)
    }
    
    
    func memoryLayoutTest() {
        
        print(MemoryLayout.size(ofValue: name))
        
        print(MemoryLayout.stride(ofValue: name))
        
        print(MemoryLayout.alignment(ofValue: name))
        
    }
    
}

///========================================================
/*
 查看内存结构
 frame variable -R num1
 fr v -R num1
 
 */
extension ViewController {
    func testOptional() {
        
        let num1: Int? = 10
        let num2: Int?? = num1
        let num3: Int?? = 10
        
        //        print(num1)
        //        print(num2)
        //        print(num3)
        num1 == num3 ? print("true"): print("false")
        num1 == num2 ? print("true"): print("false")
        print("----------------------------------------")
        let num5: Int? = nil
        let num6: Int?? = num5
        let num7: Int?? = nil
        
        //        print(num5)
        //        print(num6)
        //        print(num7)
        num5 == num6 ? print("true"): print("false")
        num5 == num7 ? print("true"): print("false")
        //        print(num6 ?? 1)
        //        print((num6 ?? 1) ?? 2)
    }
}

/// copy on write
extension ViewController {
    
    func testCopyOnWrite() {
        
        
        var s1 = "Rose"
        
        var s2 = s1
        
        print(s1, s2)
        
        s2.append("111")
        
        print(s2)
        
    }
}

/*
 typealias Fn = (Int) -> (Int, Int)
 func getFns() -> (Fn, Fn) {
 var num1 = 0
 var num2 = 0
 func plus(_ i: Int) -> (Int, Int) {
 num1 += i
 num2 += i << 1
 return (num1, num2)
 }
 func minus(_ i: Int) -> (Int, Int) {
 num1 -= i
 num2 -= i << 1
 return (num1, num2)
 }
 return (plus, minus)
 }
 */


/*
 typealias Fn = (Int) -> Int
 
 func getFn() -> Fn {
 var num = 8
 
 func plus(_ i: Int) -> Int {
 num += i
 return num
 }
 return plus(_:)
 }
 */




/// 闭包
extension ViewController {
    
    func testClosureSample() {
        
        //        var f1 = getFn()
        //        f1(1)
        //
        //        var f2 = getFn()
        //        f2(3)
        
        
        //        let (p, m) = getFns()
        //        p(8)
        //        m(2)
        
        var functions: [() -> Int] = []
        for i in 3...5 {
            functions.append { i }
        }
        
        //        for f in functions {
        //            print(f())
        //        }
    }
    
    func testAutoClosure() {
        
        compareValues(-30, swapTwoValues())
        
    }
    
    func swapTwoValues() -> Int {
        print("11111")
        let a = 10
        let b = 5
        return a + b
    }
    
    func compareValues(_ v1: Int, _ v2: @autoclosure () -> Int) -> Int? {
        print("2222")
        return v1 > 0 ? v1 : v2()
    }
    
    
}


/// point
extension ViewController {
    
    @available(iOS, renamed: "testPointSec")
    func testPointFirst(_ ptr: UnsafeMutablePointer<Int>) {
        print("p1", ptr,ptr.pointee)
        ptr.pointee = 40
        print("p11", ptr,ptr.pointee)
    }
    
    func testPointSec(_ ptr: UnsafePointer<Int>) {
        print("p2", ptr,ptr.pointee)
    }
    
    
    //void *
    func testPointThird(_ ptr: UnsafeMutableRawPointer) {
        print("p3", ptr,ptr.load(as: Int.self))
        ptr.storeBytes(of: 50, as: Int.self)
        print("p33", ptr,ptr.load(as: Int.self))
    }
    
    // const void *
    func testPointForth(_ ptr: UnsafeRawPointer) {
        print("p4", ptr,ptr.load(as: Int.self))
    }
    
    
    @available(iOS, deprecated: 11)
    func testPoint() {
        
        //        var age = 20
        
        //        testPointThird(&age)
        //        testPointForth(&age)
        
        //        var ptr = withUnsafePointer(to: &age) { $0 }
        //        print(ptr.pointee)
        //
        //        var ptr2 = withUnsafeMutablePointer(to: &age) { $0 }
        //        print(ptr2.pointee)
        //        ptr2.pointee = 33
        //        print(ptr2.pointee)
        //        print("----------------------------------")
        //
        //        var ptr3 = withUnsafePointer(to: &age) {
        //            UnsafeRawPointer($0)
        //        }
        //
        //        print(ptr3.load(as: Int.self))
        //
        //        var ptr4 = withUnsafeMutablePointer(to: &age) { ss in
        //            UnsafeMutableRawPointer(ss)
        //        }
        //
        //        print(ptr4.load(as: Int.self))
        //        ptr4.storeBytes(of: 77, as: Int.self)
        //        print(ptr4.load(as: Int.self))
        //        print("********************************")
        //        ptr4.storeBytes(of: 56, toByteOffset: 8, as: Int.self)
        //        print(ptr4.load(as: Int.self))
        //        print(ptr4.load(fromByteOffset: 8, as: Int.self))
        
        
        //        var ptr = malloc(24)
        //
        //        ptr?.storeBytes(of: 3, toByteOffset: 0, as: Int.self)
        //        ptr?.storeBytes(of: 77, toByteOffset: 8, as: Int.self)
        //        ptr?.storeBytes(of: 144, toByteOffset: 16, as: Int.self)
        //
        //        print(ptr?.load(fromByteOffset: 0, as: Int.self))
        //        print(ptr?.load(fromByteOffset: 8, as: Int.self))
        //        print(ptr?.load(fromByteOffset: 16, as: Int.self))
        //        free(ptr)
        //        print("********************************")
        
        //        var ptr = UnsafeMutableRawPointer.allocate(byteCount: 26, alignment: 1)
        //        ptr.storeBytes(of: 3, toByteOffset: 0, as: Int.self)
        //        (ptr + 8).storeBytes(of: 222, as: Int.self)
        //        (ptr + 16).storeBytes(of: 434, as: Int.self)
        ////        ptr.advanced(by: 8).storeBytes(of: 11, as: Int.self)
        ////        ptr.advanced(by: 16).storeBytes(of: 23, as: Int.self)
        //
        //        print(ptr.load(fromByteOffset: 0, as: Int.self))
        //        print((ptr + 8).load(as: Int.self))
        //        print((ptr + 16).load(as: Int.self))
        ////        print(ptr.advanced(by: 8).load(as: Int.self))
        ////        print(ptr.advanced(by: 16).load(as: Int.self))
        //
        //        ptr.deallocate()
        
        //        var ptr = UnsafeMutablePointer<Int>.allocate(capacity: 3)
        //        ptr.initialize(to: 11)
        //        ptr.successor().initialize(to: 21)
        //        ptr.successor().successor().initialize(to: 234)
        //
        //        print(ptr[0])
        //        print(ptr[1])
        //        print(ptr[2])
        //
        //        print(ptr.pointee)
        //        print((ptr + 1).pointee)
        //        print((ptr + 2).pointee)
        //
        //        ptr.deinitialize(count: 3)
        //        ptr.deallocate()
        
        let ss = """
                1
                2
                3
                4
                ''
                5
                "6"
                """
        print(ss)
        print(ss.count)
        
        for ele in ss.enumerated() {
            print("==",ele.element,"==")
        }
    }
}

extension ViewController {
    
    func testMapAndFlatMap() {
        //        var arr = [[2, 5, nil, 8], [1,7,44]]
                
        //        var newArr = arr.map {
        //            if let temp = $0 {
        //                return temp * 2
        //            }
        //        }
                
        //        var newArr = arr.flatMap {
        //            $0.flatMap {
        //                $0
        //            }
        //        }
        //        print(newArr)
        
        
        let arr = [3, 6, 30, 98]
//        func map<T>(_ transform: (Element) throws -> T) rethrows -> [T]
//        arr.map { $0 * 2 }
            
        
        
//        func reduce<Result>(_ initialResult: Result, _ nextPartialResult: (Result, Element) throws -> Result) rethrows -> Result
        let newArr = arr.reduce(0) { result, elemet in
            print(result, elemet)
            return result + elemet
        }
        
        print(newArr)
        
    }
    
    
}

