//: Playground - noun: a place where people can play

enum MyOptional<T> {
    case Some(T)
    case None
    
    init() {
        self = .None
    }
    
    init(_ some: T) {
        self = .Some(some)
    }
    
    @warn_unused_result
    func map<U>(f: (T throws -> U)) rethrows -> MyOptional<U> {
        guard let value = self else {
            return .None
        }
        
        let mappedValue = try f(value)
        return .Some(mappedValue)
        
    }
    
    @warn_unused_result
    func flatMap<U>(f: (T throws -> MyOptional<U>)) rethrows -> MyOptional<U> {
        guard let value = self else {
            return .None
        }
        
        let mappedValue = try f(value)
        return mappedValue
        
    }

}

let value = "oi" as String?
let nothing = MyOptional<Int>.None

value.dynamicType

struct Cat {}

let cat = MyOptional(Cat())

if case let .Some(gato) = cat {
    print("gato \(gato)")
}

extension MyOptional: NilLiteralConvertible {
    init(nilLiteral: ()) {
        self = .None
    }
}
let nonono: MyOptional<Int> = nil

