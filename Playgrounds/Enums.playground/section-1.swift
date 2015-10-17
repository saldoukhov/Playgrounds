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
    func each(fn: (Element) -> ()) {
        for i in self {
            fn(i)
        }
    }
}

func _printOrg(level: Int, employee: Employee) {
    func nSpaces(count: Int) -> String {
        return String(Array(count: count, repeatedValue: " "))
    }
    switch employee {
    case .Worker(let name):
        print("\(nSpaces(level))\(name)")
    case .Manager(let name, let workers):
        print("\(nSpaces(level))\(name)")
        workers.each( { _printOrg(level + 1, employee: $0)} )
    }
}

func printOrg(top: Employee) {
    _printOrg(0, employee: top)
}

printOrg(mitch)