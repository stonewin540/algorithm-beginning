import Foundation

class CQueue {
    
    private var negative: [Int]
    private var positive: [Int]

    init() {
        self.positive = Array()
        self.negative = Array()
    }
    
    func appendTail(_ value: Int) {
        self.positive.append(value)
    }
    
    func deleteHead() -> Int {
        if self.negative.isEmpty && self.positive.isEmpty {
            return -1
        }
        
        if self.negative.isEmpty && !self.positive.isEmpty {
//            self.negative = self.negative + self.positive.reversed()
            var value = self.positive.popLast()
            while nil != value {
                self.negative.append(value!)
                value = self.positive.popLast()
            }
            
            self.positive.removeAll()
        }
        
        let top = self.negative.popLast()
        return top!
    }
}

let obj = CQueue()
obj.deleteHead()
obj.appendTail(5)
obj.appendTail(2)
obj.deleteHead()
obj.deleteHead()
