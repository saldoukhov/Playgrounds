import UIKit
import LinqKit


",".join(["a", "b", "c"])

let flags = "🇺🇸US🇷🇺RF"
let count1 = countElements(flags)
let count2 = flags.utf16Count
let count3 = (flags as NSString).length
let count4 = flags.lengthOfBytesUsingEncoding(NSUTF16StringEncoding)
let count5 = flags.lengthOfBytesUsingEncoding(NSUTF8StringEncoding)

// LinqKit

let l = flags.length
