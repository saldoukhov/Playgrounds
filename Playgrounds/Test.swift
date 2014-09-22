//
//  Test.swift
//  Playgrounds
//
//  Created by Sergey Aldoukhov on 9/21/14.
//  Copyright (c) 2014 Sergey Aldoukhov. All rights reserved.
//

import Foundation

public struct Bite<T where T:SequenceType> {
    let source:T
    
    public init(_ source:T) {
        self.source = source
    }
}

extension Bite : SequenceType {
    
    public func generate() -> T.Generator {
        return source.generate()
    }
}

extension Bite {
    
    public func dictionary<KeyType : Hashable, ValueType>(pairs: T.Generator.Element -> (KeyType, ValueType)) -> Dictionary<KeyType, ValueType> {
        var dictionary = Dictionary<KeyType, ValueType>()
        for element in source {
            let (key, value) = pairs(element)
            dictionary[key] = value
        }
        return dictionary
    }
}

extension LazySequence {
    
    public func dictionary<KeyType : Hashable, ValueType>(pairs: S.Generator.Element -> (KeyType, ValueType)) -> Dictionary<KeyType, ValueType> {
        var dictionary = Dictionary<KeyType, ValueType>()
        for element in self {
            let (key, value) = pairs(element)
            dictionary[key] = value
        }
        return dictionary
    }
}

extension Array {
    
    func test() -> Int {
        return 1
    }

//    public func dictionary<KeyType : Hashable, ValueType>(pairs: T.Generator.Element -> (KeyType, ValueType)) -> Dictionary<KeyType, ValueType> {
//        var dictionary = Dictionary<KeyType, ValueType>()
//        for element in source {
//            let (key, value) = pairs(element)
//            dictionary[key] = value
//        }
//        return dictionary
//    }
    
    func toDictionary<Key: Hashable, Item>(fn:Item -> Key) -> Dictionary<Key,Item> {
        var to = Dictionary<Key,Item>()
        for x in self {
            let e = x as Item
            let key = fn(e)
            to[key] = e
        }
        return to
    }

    func addToDictionary2<Key, M, I>(fn:I -> M, keyFn:M -> Key) {
        //        var dict = Dictionary<Key, Int>()
        let f = self.first! as I
        let m = fn(f)
        let key = keyFn(m)
        //      dict[key] = self
    }
    
}

extension Int : Hashable {
    func test() -> Int {
        return 1
    }
    
    func addToDictionary<Key, M>(fn:() -> M, keyFn:M -> Key) {
//        var dict = Dictionary<Key, Int>()
        let m = fn()
        let key = keyFn(m)
  //      dict[key] = self
    }
}
    

public class TestClass: NSObject {
    
//    func intAsHashable<Key: Hashable>(value: Int) -> Key {
//        return value.hashValue
//    }
    
    func addToDictionary<Key: Hashable, Value>(key: Key, value: Value) {
        var dict =  Dictionary<Key, Value>()
        dict[key] = value
    }
    
    func addToDictionary1<T: Hashable, T1>(value: [T1], fn:T1 -> T) {
        var dict =  Dictionary<T, T1>()
        for x in value {
            dict[fn(x)] = x
        }
    }

    func Test() {
        println("test")
        let arr : Array<Int> = [1]
        let t = arr.test()
        let i = 1
        i.addToDictionary({ 1 }, keyFn:{ $0 })
        addToDictionary(1, value: 2)
        addToDictionary1([1, 2], { $0 } )
        let bite = Bite([1, 2])
        let dict = bite.dictionary({ ($0, $0) })
        let ls = LazySequence([1, 2])
        let dict1 = ls.dictionary({ ($0, $0) })
//        [1, 2].addToDictionary2({ $0 }, keyFn:{ $0 })
    
//        let h: Hashable = i
//        let d = arr.toDictionary( { item in return item.hasValue } )
    }
    
}