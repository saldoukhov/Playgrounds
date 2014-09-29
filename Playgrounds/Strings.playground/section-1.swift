import UIKit

",".join(["a", "b", "c"])

let s = String(seq: Array(count: 10, repeatedValue: "A"))

let flags = "🇺🇸US🇷🇺RF"
countElements(flags)
flags.utf16Count
(flags as NSString).length
flags.lengthOfBytesUsingEncoding(NSUTF16StringEncoding)
flags.lengthOfBytesUsingEncoding(NSUTF8StringEncoding)
let asciiStr = "ABCD"
asciiStr.utf16Count
(asciiStr as NSString).length
asciiStr.lengthOfBytesUsingEncoding(NSUTF16StringEncoding)
asciiStr.lengthOfBytesUsingEncoding(NSUTF8StringEncoding)

let str = "abcdefg"
let s0 = str.startIndex
let s2 = advance(s0, 2)
let str2 = str.substringFromIndex(s2)
let str5 = str.substringFromIndex(s2).substringToIndex(advance(s2, 2))
let str6 = str.substringWithRange(s2...s2.successor())
let dist = distance(s0, s2)
str[s2]
str.hasPrefix("abc")
str.hasSuffix("def")
str.rangeOfString("cd")!
let split = "abc def".componentsSeparatedByString(" ")

let strWithRepeats = "abcdgcdf"
let r1 = strWithRepeats.rangeOfString("cd")!
let r2 = strWithRepeats.substringFromIndex(advance(r1.startIndex, 1)).rangeOfString("cd")!

var s1 = "ab"
s1 += "cd"
s1 = s1 + "cd"
