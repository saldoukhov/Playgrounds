// Playground - noun: a place where people can play

import UIKit

var dictWithNulls = Dictionary<String, Int?>()

dictWithNulls = ["1": 1, "2": nil]

dictWithNulls["2"]
dictWithNulls["3"]
dictWithNulls["1"] = nil
dictWithNulls.indexForKey("1") == nil  // Objective C legacy lives
dictWithNulls.indexForKey("2") == nil
let f =
    filter(dictWithNulls, { $0.1 == nil })


let strDict = ["1": "a", "2": "b"]

let els =
    map(strDict, { $0.0 })

let fEls =
    filter(strDict, { $0.0 == "1" })
