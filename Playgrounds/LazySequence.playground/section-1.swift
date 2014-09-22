// Playground - noun: a place where people can play

import UIKit

extension LazySequence {

    public func dictionary<KeyType : Hashable, ValueType>(pairs: S.Generator.Element -> (KeyType, ValueType)) -> Dictionary<KeyType, ValueType> {
        var dictionary = Dictionary<KeyType, ValueType>()
        for element in self {
            let (key, value) = pairs(element)
            dictionary[key] = value
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
    
}

let items =
    LazySequence(["hElLo", "wOrld"]).dictionary({ ( $0.uppercaseString, $0.lowercaseString ) })

