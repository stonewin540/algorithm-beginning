import Foundation

/**
 输入: s = "abcabcbb"
 输出: 3
 解释: 因为无重复字符的最长子串是 "abc"，所以其长度为 3。
 示例 2:

 输入: s = "bbbbb"
 输出: 1
 解释: 因为无重复字符的最长子串是 "b"，所以其长度为 1。
 示例 3:

 输入: s = "pwwkew"
 输出: 3
 解释: 因为无重复字符的最长子串是 "wke"，所以其长度为 3。
      请注意，你的答案必须是 子串 的长度，"pwke" 是一个子序列，不是子串。
 示例 4:

 输入: s = ""
 输出: 0

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/longest-substring-without-repeating-characters
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */
/*
func lengthOfLongestSubstring(_ s: String) -> Int {
    let strArray = s.map({ String($0) })
    if strArray.count <= 1 {
        return strArray.count
    }
    
    var prevIndex = [String: Int]()
    prevIndex[strArray[0]] = 0
    
    var li = 0
    
    var length = 0
    
    for i in 1..<strArray.count {
        var pi = prevIndex[strArray[i]]
        
        if nil != pi && pi! >= li {
            li = pi! + 1
        }
        prevIndex[strArray[i]] = i
        
        length = max(length, i-li+1)
    }
    
    return length
}
*/

func lengthOfLongestSubstring(_ s: String) -> Int {
    let strArray = s.map({ String($0) })
    let length = strArray.count
    
    if length <= 1 {
        return length
    }
    
    var preIndexes = [String: Int]()
    preIndexes.updateValue(0, forKey: strArray[0])
    
    var li = 0
    var max_length = 0
    
    for index in 1..<length {
        let str = strArray[index]
        var pi = preIndexes[str]
        if nil == pi {
            pi = -1
        }
        
        if pi! >= li {
            li = pi! + 1
        }
        
        preIndexes[str] = index
        
        max_length = max(max_length, index - li + 1)
    }
    
    return max_length
}
func lengthOfLongestSubstring2(_ s: String) -> Int {
    let strArray = s.map({ String($0) })
    let length = strArray.count
    if length <= 1 {
        return length
    }
    
    var preIndexes = [Int](repeating: -1, count: 128)
    preIndexes[Int((strArray[0].first?.asciiValue)!)] = 0
    
    var li = 0
    var max_length = 0
    
    for index in 1..<length {
        let str = strArray[index]
        let asciiIndex = Int((str.first?.asciiValue)!)
        let pi = preIndexes[asciiIndex]
        if pi >= li {
            li = pi + 1
        }
        
        preIndexes[asciiIndex] = index
        
        max_length = max(max_length, index - li + 1)
    }
    
    return max_length
}

print(lengthOfLongestSubstring("abcabcbb"))
print(lengthOfLongestSubstring("bbbbb"))
print(lengthOfLongestSubstring("pwwkew"))
print(lengthOfLongestSubstring(""))
