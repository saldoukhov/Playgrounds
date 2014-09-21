// Playground - noun: a place where people can play

import UIKit

enum Employee {
    case Manager(String, [Employee])
    case Worker(String)
}

let mitch = Employee.Manager("Mitch", [
    Employee.Manager("Bryan", [
        Employee.Worker("Alex"),
        Employee.Worker("Angela")
        ]),
    Employee.Worker("Eric"),
    Employee.Worker("John")
    ])

extension Array {
    func each(fn: (T) -> ()) {
        for i in self {
            fn(i)
        }
    }
}

extension String {
    func repeat(count: Int) -> String {
        var str = ""
        for _ in 0..<count {
            str += self
        }
        return str
    }
}

func _printOrg(level: Int, employee: Employee) {
    func nSpaces(count: Int) -> String {
        return "  ".repeat(count)
    }
    switch employee {
    case .Worker(let name):
        println("\(nSpaces(level))\(name)")
    case .Manager(let name, let workers):
        println("\(nSpaces(level))\(name)")
        workers.each( { _printOrg(level + 1, $0)} )
    }
}

func printOrg(top: Employee) {
    _printOrg(0, top)
}

printOrg(mitch)
