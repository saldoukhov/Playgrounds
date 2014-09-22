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

//    public func groupBy<KeyType : Hashable>(transform: S.Generator.Element -> KeyType) -> Bite<Dictionary<KeyType, Array<T.Generator.Element>>> {
//
//        var dictionary = Dictionary<KeyType, Array<S.Generator.Element>>()
//        for element in self {
//            let key = transform(element)
//            let foundArray = dictionary[key]
//            var array = foundArray ?? Array<T.Generator.Element>()
//            array += [element]
//            dictionary[key] = array
//        }
//        return LazySequence<Dictionary<KeyType, Array<T.Generator.Element>>>(dictionary)
//    }

extension Array {
    
    func dictionary<Key : Hashable>(key: Element -> Key) -> Dictionary<Key, Element> {
        return sequenceToDictionary(self, key);
    }
    
    func dictionary<Key : Hashable>(key: Element -> (Key, Element)) -> Dictionary<Key, Element> {
        return sequenceToDictionary(self, key);
    }
}

let dict1 =
    [1, 2, 3].dictionary({ $0 })


let dict2 =
    ["hElLo", "wOrld"].dictionary({ ( $0.uppercaseString, $0.lowercaseString ) })