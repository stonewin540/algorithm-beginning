import Foundation

/**
 给你一个字符串 s ，逐个翻转字符串中的所有 单词 。

 单词 是由非空格字符组成的字符串。s 中使用至少一个空格将字符串中的 单词 分隔开。

 请你返回一个翻转 s 中单词顺序并用单个空格相连的字符串。

 说明：

 输入字符串 s 可以在前面、后面或者单词间包含多余的空格。
 翻转后单词间应当仅用一个空格分隔。
 翻转后的字符串中不应包含额外的空格。
  

 示例 1：

 输入：s = "the sky is blue"
 输出："blue is sky the"
 示例 2：

 输入：s = "  hello world  "
 输出："world hello"
 解释：输入字符串可以在前面或者后面包含多余的空格，但是翻转后的字符不能包括。
 示例 3：

 输入：s = "a good   example"
 输出："example good a"
 解释：如果两个单词间有多余的空格，将翻转后单词间的空格减少到只含一个。
 示例 4：

 输入：s = "  Bob    Loves  Alice   "
 输出："Alice Loves Bob"
 示例 5：

 输入：s = "Alice does not even like bob"
 输出："bob like even not does Alice"
  

 提示：

 1 <= s.length <= 104
 s 包含英文大小写字母、数字和空格 ' '
 s 中 至少存在一个 单词
  

 进阶：

 请尝试使用 O(1) 额外空间复杂度的原地解法。

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/reverse-words-in-a-string
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */

func reverseWords(_ s: String) -> String {
    var strArr = s.map({ String($0) })
//    print(strArr)
    
    // remove blank
    var cur = 0
    var space = true
    for i in 0..<strArr.count {
        if " " != strArr[i] {
            strArr[cur] = strArr[i]
            cur += 1
            space = false
        } else if (false == space) {
            strArr[cur] = " "
            cur += 1
            space = true
        }
    }
    let len = space ? cur-1 : cur
    if 0 == len {
        return ""
    }
//    print(strArr[0..<len])
    
    // reverse all
    reverseArray(arr: &strArr, loc: 0, len: len)
//    print(strArr)
    
    // reverse some
    var pi = -1
    for i in 0..<len {
        let str = strArr[i]
        if " " != str {
            continue
        }
        
        reverseArray(arr: &strArr, loc: pi+1, len: i-(pi+1))
        pi = i
    }
    reverseArray(arr: &strArr, loc: pi+1, len: len-(pi+1))
//    print(strArr)
    
    return strArr[0..<len].joined()
}

func reverseArray( arr: inout [String], loc: Int, len: Int) {
    var l = loc
    var r = loc + len - 1
    while l < r {
        let tmp = arr[l]
        arr[l] = arr[r]
        arr[r] = tmp
        l += 1
        r -= 1
    }
}

print(reverseWords("the sky is blue     "))
