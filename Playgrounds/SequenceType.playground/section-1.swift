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
        let (key, _) = pair(element)
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

func max<S: SequenceType, V: Comparable>(source: S, selector: S.Generator.Element -> V) -> V? {
    var maxValue: V? = nil
    for element in source {
        let current = selector(element)
        if maxValue == nil {
            maxValue = current
        }
        else {
            if current > maxValue {
                maxValue = current
            }
        }
    }
    return maxValue
}

func myMap<S: SequenceType, V>(source: S, selector: S.Generator.Element -> V) -> AnySequence<V>  {
    let seq = AnySequence({
        _ -> AnyGenerator<V> in
        var gen = source.generate()
        return anyGenerator({
            let v = gen.next()
            return v == nil ? nil : selector(v!)
        })
    })
    return seq
}

func scan<S: SequenceType, State>(source: S, initialState: State, selector: (State, S.Generator.Element) -> State) -> AnySequence<State>  {
    let seq = AnySequence {
        _ -> AnyGenerator<State> in
        var gen = source.generate()
        var state = initialState
        return anyGenerator({
            let v = gen.next()
            if v == nil {
                return nil
            }
            state = selector(state, v!)
            return state
        })
    }
    return seq
}


extension Array {
    
    func dictionary<Key : Hashable>(key: Element -> Key) -> Dictionary<Key, Element> {
        return sequenceToDictionary(self, key: key)
    }

    func dictionary<Key : Hashable>(pair: Element -> (Key, Element)) -> Dictionary<Key, Element> {
        return sequenceToDictionary(self, pair: pair)
    }
    
    func group<Key : Hashable>(key: Element -> Key) -> Dictionary<Key, [Element]> {
        return sequenceToGroups(self, key: key)
    }
    
    func max<V: Comparable>(selector: Element -> V) -> V? {
        return max(selector)
    }
}

let dict1 =
    [1, 2, 3].dictionary({ $0 })


let dict2 =
    ["hElLo", "wOrld"].dictionary({ ( $0.uppercaseString, $0.lowercaseString ) })

let dict3 =
    [10, 11, 12, 20, 21, 30 ].group( { $0 / 10 } )

//let maxVal = [3, 2, 5, 1].max( { $0 } )

let naturals = AnySequence {
    _ -> AnyGenerator<Int> in
    var i = 0
    return anyGenerator({ ++i })
}

var n = naturals.generate()
n.next()
