import UIKit

let arr = ["zz", "ff", "aa"]

let sarr1 =
arr.sorted( { s1, s2 in return s1 < s2 } )

let sarr2 =
sorted(arr, { s1, s2 in return s1 < s2 } )

let sarr3 = arr.sorted( { $0 < $1 } )

let sarr4 = arr.sorted( < )

let nsArr = NSArray(objects: "zz", "ff", "aa")
let nsArr1 = NSArray(array: arr)

let arrFromNS = Array(nsArr)

var marr = ["zz", "ff", "aa"]

marr.sort( { s1, s2 in return s1 < s2 } )

let narr = [1, 2, 3, 4]

[].join([[1, 2], [3, 4], [5, 6]])

[100].join([[1, 2], [3, 4], [5, 6]])

let narrFiltered =
narr.filter( { $0 < 3 } )

let narrMapped =
narr.map( { String($0) } )

let n = 1
narr[0...n]
narr[narr.startIndex..<narr.endIndex]
narr[0..<advance(narr.startIndex, narr.count)]
Slice(narr)

let n2 = narr.startIndex.advancedBy(2)
narr.startIndex
narr.endIndex
narr.count
let n3 = advance(n2, 1)
narr[n2...n2+1] == [3, 4]

Array(count: 10, repeatedValue: 1)

let zipped = Array(Zip2(["a", "b", "c"], [1, 2]))

let firstNum = narr.first!

let sumBelow4 = narr
    .filter( { $0 < 4 } )
    .reduce(0, +)

Array("abcd")
[Character]("abcd")
let chars1 =
    Array(map("abcd", { $0 }))
let chars2 =
    Array(lazy("abcd").map({ $0 }))

class Numbers : SequenceType {
    let max: Int = 10
    
    init(max: Int) {
        self.max = max
    }
    
    func generate() -> GeneratorOf<Int> {
        var i = 0
        return GeneratorOf<Int> {
            if i >= self.max { return .None }
            return .Some(i++)
        }
    }
}

let nums = Numbers(max: 5)

