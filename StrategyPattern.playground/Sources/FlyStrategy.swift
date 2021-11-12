import Foundation

public protocol FlyStrategy: AnyObject {
    func fly()
}

public class FlyWithWings: FlyStrategy {
    
    public init() {
        
    }
    
    public func fly() {
        print("I am flying")
    }
}

public class FlyNoWay: FlyStrategy {
    
    public init() {
        
    }
    
    public func fly() {
        print("I can't fly")
    }
}
