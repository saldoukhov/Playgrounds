//: Playground - noun: a place where people can play

import UIKit

var arr = ["zz", "ff", "aa"]

let sarr1 = arr.sort( { s1, s2 in return s1 < s2 } )

arr.sortInPlace({ s1, s2 in return s1 < s2 })

let sarr3 = arr.sort( { $0 < $1 } )

let sarr4 = arr.sort( < )

let nsArr = NSArray(objects: "zz", "ff", "aa")
let nsArr1 = NSArray(array: arr)

let arrFromNS = Array(nsArr)

var marr = ["zz", "ff", "aa"]

marr.sort( { s1, s2 in return s1 < s2 } )
marr

let narr = [1, 2, 3, 4]

let flat = [[1, 2], [3, 4], [5, 6]].flatMap( { $0 } )
flat

["a","b","c"].joinWithSeparator(",")

let narrFiltered = narr.filter( { $0 < 3 } )

let narrMapped = narr.map(String.init)

let n = 1

narr[0...n]

narr[narr.startIndex..<narr.endIndex]

narr[0..<narr.startIndex.advancedBy(narr.count)]

let r = Range(start: narr[0], end: narr[2])
let slice = Slice(base: narr, bounds: r)
Array(slice)


let n2 = narr.startIndex.advancedBy(2)

narr.startIndex
narr.endIndex
narr.count

narr[n2...n2+1] == [3, 4]

Array(count: 10, repeatedValue: 1)

let zipped = Array(zip(["a", "b", "c"], [1, 2]))

let firstNum = narr.first!

let sumBelow4 = narr
    .filter( { $0 < 4 } )
    .reduce(0, combine: +)
sumBelow4

[Character]("abcd".characters)

class Numbers : SequenceType {
    var max: Int = 10
    
    init(max: Int) {
        self.max = max
    }
    
    func generate() -> AnyGenerator<Int> {
        var i = 0
        return anyGenerator() {
            if i >= self.max { return .None }
            return .Some(i++)
        }
    }
}

let nums = Numbers(max: 5)
Array(nums)
