import Foundation

// 斐波那契数列
// 0, 1, 2, 3, 4, 5, 6, 7, 8
// 0, 1, 1, 2, 3, 5, 8, 13, 21

// recursively
func fib1(_ num: Int) -> Int {
    if num <= 1 {
        return num
    }
    let res = fib1(num - 1) + fib1(num - 2)
    return res
}

// iterator
func fib2(_ num: Int) -> Int {
    if num <= 1 {
        return num
    }
    
    var first = 0
    var second = 1
    for _ in 1..<num {
        let sum = first + second
        first = second
        second = sum
    }
    return second
}

var funcs = [fib1, fib2];
for aFunc in funcs {
    // checkin
    let start = NSDate()
    
//    for item in 0...25 {
//        print("\(aFunc(item)), ", separator: "", terminator: "")
        let item = 10
        print("\(item)th. fib number is: \(aFunc(item))")
//    }
    
    // checkout
    let end = NSDate()
    let diff = end.timeIntervalSince1970 - start.timeIntervalSince1970
    
    print("")
    print("\(String(describing: aFunc))\(type(of: aFunc)) dur: \(diff) sec(s).")
}
