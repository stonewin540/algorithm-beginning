import Cocoa


func reverseWords(_ s: String) -> String {
    // s to a[s]
    var strArray = s.map({ String($0) })
//    print(strArray)
    
    // remove adundant spaces
    var cur = 0
    var space = true
    for i in 0..<strArray.count {
        let str = strArray[i]
        if " " != str {
            strArray[cur] = strArray[i]
            cur += 1
            space = false
        } else if false == space {
            strArray[cur] = " "
            cur += 1
            space = true
        }
    }
    
    let len = space ? (cur - 1) : cur
//    print(len)
    if len <= 0 {
        return ""
    }
    
    // reverse sentance
    reverse(&strArray, loc: 0, len: len)
//    print(strArray)
    
    // reverse words
    var prevSpaceIndex = -1
    for i in 0..<len {
        let str = strArray[i]
        if " " != str {
            continue
        }
        
        let loc = prevSpaceIndex + 1
        let len = i - prevSpaceIndex - 1;
//        print("str: \(str), prev: \(loc), len: \(len)")
        reverse(&strArray, loc: loc, len: len)
        prevSpaceIndex = i
    }
    // reverse the last
    reverse(&strArray, loc: prevSpaceIndex+1, len: len-prevSpaceIndex-1)
//    print(strArray)
    
    return strArray[0..<len].joined()
}

private func reverse(_ input: inout [String], loc: Int, len: Int) {
    var li = loc
    var ri = loc + len - 1
    
    while li < ri {
        let tmp = input[li];
        input[li] = input[ri];
        input[ri] = tmp
        
        li += 1
        ri -= 1
    }
}

print("666_" + reverseWords(" hello world!     ") + "_666")
print("666_" + reverseWords("a good      example") + "_666")
print("666_" + reverseWords("are you ok") + "_666")
print("666_" + reverseWords("                  ") + "_666")
print("666_" + reverseWords("") + "_666")


//func separatToArray(_ input: String) -> [String] {
//    var arr = Array(repeating: "", count: input.count)
//    for (idx, val) in input.enumerated() {
//        arr[idx] = String(val)
//    }
//    return arr
//}
//func joinToStr(_ input: [String], _ len: Int) -> String {
//    var str = String()
//    for idx in 0..<input.count {
//        if idx >= len {
//            break
//        }
//        str += input[idx]
//    }
//    return str
//}

//func formatString(_ arr: [String]) -> ([String], len: Int) {
//    if 0 == arr.count {
//        return ([], 0)
//    }
//
//    var cur = 0
//    var space = true
//    var copy = arr
//    var len = 0
//
//    for idx in 0..<copy.count {
//        let str = copy[idx]
//        if " " != str {
//            copy[cur] = copy[idx]
//            space = false
//            cur += 1
//        } else if false == space {
//            copy[cur] = " "
//            space = true
//            cur += 1
//        } else {
//            space = true
//        }
//    }
//
//    len = max(0, space ? cur-1 : cur)
//    return (copy, len)
//}
//
//func reverse(_ input: [String], loc: Int, len: Int) -> [String] {
//    var copy:[String] = input
//    var l = loc
//    var r = loc + len - 1
//
//    while l < r {
//        let tmp = copy[r]
//        copy[r] = copy[l]
//        copy[l] = tmp
//
//        l += 1
//        r -= 1
//    }
//
//    return Array(copy[loc..<len])
//}
//
//// test
//let input = "  here  you     go!    "
//let arr = separatToArray(input)
//print(arr)
//let fmtTpl = formatString(arr)
//print(fmtTpl)
//let fmtString = joinToStr(fmtTpl.0, fmtTpl.1)
//print("fmtString: 666_" + fmtString + "_666")
////
//let revArr = reverse(fmtTpl.0, loc: 0, len: fmtTpl.1)
//print(revArr)
//let revString = joinToStr(revArr, fmtTpl.1)
//print("revString: 666_" + revString + "_666")
////
//var resArr = revArr
//var prev = -1
//for idx in 0..<resArr.count {
//    let str = resArr[idx]
//    if " " == str {
////        print("str: \(str), prev: \(prev), idx: \(idx)")
//        prev += 1
//        let r_arr = reverse(resArr, loc: prev, len: idx-prev+1)
//        print("loc: \(prev), len: \(idx-prev+1), arr: \(r_arr)")
//        resArr.replaceSubrange(prev..<idx-prev+1, with: r_arr)
//        prev = idx
//    }
//}
//print(resArr)
