import UIKit

["a", "b", "c"].joinWithSeparator("/")

let s = String(Array(count: 10, repeatedValue: "A"))

let flags = "🇺🇸US🇷🇺RF"
flags.characters.count
flags.unicodeScalars.count
flags.utf8.count
flags.utf16.count
(flags as NSString).length
flags.lengthOfBytesUsingEncoding(NSUTF16StringEncoding)
flags.lengthOfBytesUsingEncoding(NSUTF8StringEncoding)
let asciiStr = "ABCD"

let str = "abcdefg"
let s0 = str.startIndex
let s2 = str.startIndex.advancedBy(2)
let str2 = str.substringFromIndex(s2)
let str5 = str.substringFromIndex(s2).substringToIndex(str.startIndex.advancedBy(4))
let str6 = str.substringWithRange(s2...s2.successor())
let dist = s0.distanceTo(s2)
str[s2]
str.hasPrefix("abc")
str.hasSuffix("def")
str.rangeOfString("cd")!
let split = "abc def".componentsSeparatedByString(" ")

let strWithRepeats = "abcdgcdf"
let r1 = strWithRepeats.rangeOfString("cd")!
let r2 = strWithRepeats.substringFromIndex(r1.startIndex.advancedBy(1)).rangeOfString("cd")!

var s1 = "ab"
s1 += "cd"
s1 = s1 + "cd"
