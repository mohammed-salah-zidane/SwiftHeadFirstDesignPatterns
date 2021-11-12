import Foundation

public protocol QuackStrategy: AnyObject {
    func quack()
}

public class Quack: QuackStrategy {
    
    public init() {
        
    }
    
    public func quack() {
        print("Quack")
    }
}

public class MuteQuack: QuackStrategy {
    
    public init() {
        
    }
    
    public func quack() {
        print("silence")
    }
}

public class Squack: QuackStrategy {
    
    public init() {
        
    }
    
    public func quack() {
        print("squack")
    }
}
