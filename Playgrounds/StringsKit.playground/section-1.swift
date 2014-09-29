// Playground - noun: a place where people can play

import UIKit

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

let str = "abcdefg"
str.substringToIndex(3)
str.substringFromIndex(3)
str.substringWithRange(2...4)
str[3]
str[2...4]
" abc ".trim()

