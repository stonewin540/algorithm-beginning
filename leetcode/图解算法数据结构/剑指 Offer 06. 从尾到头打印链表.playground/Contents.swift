import Foundation

// Definition for singly-linked list.
public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
}

func reversePrint(_ head: ListNode?) -> [Int] {
    var stack = Array(repeating: 0, count: 0)
    
    var cur = head
    while nil != cur {
        let val = cur?.val
        if nil != val {
            stack.insert(val!, at: 0)
        }
        cur = cur?.next
    }
    
    return stack
}

var head: ListNode? = nil
var cur: ListNode? = nil
for i in [1,3,2] {
    let rand = Int(i) //Int(arc4random_uniform(100))
    if nil == head {
        head = ListNode(rand)
        cur = head
    } else {
        cur?.next = ListNode(rand)
        cur = cur?.next
    }
}

print(reversePrint(head))
