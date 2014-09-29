// Playground - noun: a place where people can play

import UIKit

var dictWithNulls = Dictionary<String, [Int]?>()

dictWithNulls = ["1": [1, 2], "2": nil, "3": [3, 4]]

dictWithNulls["2"]
dictWithNulls["4"]
dictWithNulls.indexForKey("2") == .None
dictWithNulls.indexForKey("4") == .None


let strDict = ["1": "a", "2": "b"]

let els =
    map(strDict, { $0.0 })

let fEls =
    filter(strDict, { $0.0 == "1" })