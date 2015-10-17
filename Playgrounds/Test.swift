//
//  Test.swift
//  Playgrounds
//
//  Created by Sergey Aldoukhov on 9/21/14.
//  Copyright (c) 2014 Sergey Aldoukhov. All rights reserved.
//

import Foundation

func myMap<S: SequenceType, V>(source: S, selector: S.Generator.Element -> V) -> AnySequence<V>  {
    let seq = AnySequence {
        _ -> AnyGenerator<V> in
        var gen = source.generate()
        return anyGenerator {
            let v = gen.next()
            return v == nil ? nil : selector(v!)
        }
    }
    return seq
}

//func myMap<S: SequenceType, V>(source: S, selector: S.Generator.Element -> V) -> LazySequence<SequenceOf<V>>  {
//    let seq = SequenceOf {
//        _ -> GeneratorOf<V> in
//        var gen = source.generate()
//        return GeneratorOf {
//            let v = gen.next()
//            return v == nil ? nil : selector(v!)
//        }
//    }
//    return lazy(seq)
//}

struct TransientView<S: SequenceType> : SequenceType {

    private let seq: S

    init(_ seq: S) {
        self.seq = seq
    }
    
    func generate()
        -> AnyGenerator<S.Generator.Element> {
            var g = seq.generate()
            return anyGenerator {
                print("next")
                return g.next()
            }
    }
}

public class TestClass: NSObject {
    
    func Test() {
        let seq = lazy(map(TransientView([1, 2, 3]), { $0 * 2 }))
        print("test")
    }
    
}