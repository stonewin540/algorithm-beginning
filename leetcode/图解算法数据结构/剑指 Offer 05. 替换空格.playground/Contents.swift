import Foundation

func replaceSpace(_ s: String) -> String {
    let kSpace: Character = " "
    let kPlaceholder: String = "%20"
    var res = String()
    
    for ch in s {
        if kSpace == ch {
            res.append(kPlaceholder)
        } else {
            res.append(ch)
        }
    }
    
    return res
}

// checkout
print(replaceSpace("We are happy."))
print(replaceSpace(""))
