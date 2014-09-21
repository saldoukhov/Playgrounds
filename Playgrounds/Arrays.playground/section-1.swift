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

let narrFiltered =
narr.filter( { $0 < 3 } )

let narrMapped =
narr.map( { String($0) } )

let zipped = Array(Zip2(["a", "b", "c"], [1, 2]))

let firstNum = narr.first!

let sumBelow4 = narr
    .filter( { $0 < 4 } )
    .reduce(0, +)

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

