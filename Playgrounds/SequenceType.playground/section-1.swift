// Playground - noun: a place where people can play

import UIKit

func sequenceToDictionary<S: SequenceType, Key : Hashable>(source: S, key: S.Generator.Element -> Key) -> Dictionary<Key, S.Generator.Element> {
    var dictionary = Dictionary<Key, S.Generator.Element>()
    for element in source {
        let key = key(element)
        dictionary[key] = element
    }
    return dictionary
}

func sequenceToDictionary<S: SequenceType, Key : Hashable>(source: S, pair: S.Generator.Element -> (Key, S.Generator.Element)) -> Dictionary<Key, S.Generator.Element> {
    var dictionary = Dictionary<Key, S.Generator.Element>()
    for element in source {
        let (key, value) = pair(element)
        dictionary[key] = element
    }
    return dictionary
}

func sequenceToGroups<S: SequenceType, Key : Hashable>(source: S, key: S.Generator.Element -> Key) -> Dictionary<Key, [S.Generator.Element]> {
    var dictionary = Dictionary<Key, [S.Generator.Element]>()
    for element in source {
        let key = key(element)
        let foundArray = dictionary[key]
        var array = foundArray ?? Array<S.Generator.Element>()
        array.append(element)
        dictionary[key] = array
    }
    return dictionary
}



extension Array {
    
    func dictionary<Key : Hashable>(key: Element -> Key) -> Dictionary<Key, Element> {
        return sequenceToDictionary(self, key);
    }

    func dictionary<Key : Hashable>(pair: Element -> (Key, Element)) -> Dictionary<Key, Element> {
        return sequenceToDictionary(self, pair);
    }
    
    func group<Key : Hashable>(key: Element -> Key) -> Dictionary<Key, [Element]> {
        return sequenceToGroups(self, key);
    }
}

let dict1 =
    [1, 2, 3].dictionary({ $0 })


let dict2 =
    ["hElLo", "wOrld"].dictionary({ ( $0.uppercaseString, $0.lowercaseString ) })

let dict3 =
    [10, 11, 12, 20, 21, 30 ].group( { $0 / 10 } )

let naturals = SequenceOf {
    _ -> GeneratorOf<Int> in
    var i = 0
    return GeneratorOf {
        ++i
    }
}

var n = naturals.generate()
n.next()
