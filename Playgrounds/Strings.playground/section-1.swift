import UIKit

",".join(["a", "b", "c"])

let s = String(seq: Array(count: 10, repeatedValue: "A"))

let flags = "🇺🇸US🇷🇺RF"
countElements(flags)
flags.utf16Count
(flags as NSString).length
flags.lengthOfBytesUsingEncoding(NSUTF16StringEncoding)
flags.lengthOfBytesUsingEncoding(NSUTF8StringEncoding)

let str = "abcdefg"
str[3]
let s0 = str.startIndex
let s2 = advance(s0, 2)
let str2 = str.substringFromIndex(s2)
str2.hasPrefix("cd")
let dist = distance(s0, s2)
str[s2]
str.hasPrefix("abc")
str.hasSuffix("def")
let r = str.rangeOfString("cd")!
let split = "abc def".componentsSeparatedByString(" ")

extension String {
    
    func substringToIndex(index:Int) -> String {
        return self.substringToIndex(advance(self.startIndex, index))
    }
    
    func substringFromIndex(index:Int) -> String {
        return self.substringFromIndex(advance(self.startIndex, index))
    }
    
    func substringWithRange(range:Range<Int>) -> String {
        let start = advance(self.startIndex, range.startIndex)
        let end = advance(self.startIndex, range.endIndex)
        return self.substringWithRange(start..<end)
    }
    
    subscript(index:Int) -> Character{
        return self[advance(self.startIndex, index)]
    }
    
    subscript(range:Range<Int>) -> String {
        let start = advance(self.startIndex, range.startIndex)
            let end = advance(self.startIndex, range.endIndex)
            return self[start..<end]
    }
    
    func replaceCharactersInRange(range:Range<Int>, withString: String!) -> String {
        var result:NSMutableString = NSMutableString(string: self)
        result.replaceCharactersInRange(NSRange(range), withString: withString)
        return result
    }
    
    func trim() -> String {
        return (self as String).stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceCharacterSet())
    }
}

str.substringToIndex(3)
str.substringFromIndex(3)
str.substringWithRange(2...4)
str[3]
str[2...4]
" abc ".trim()