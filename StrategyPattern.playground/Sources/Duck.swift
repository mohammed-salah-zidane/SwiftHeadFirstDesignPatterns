import Foundation

open class Duck {
    public var flyBehavior: FlyStrategy?
    public var quackBehavior: QuackStrategy?
    
    public init() {
        
    }
    
    public func performFly() {
        flyBehavior?.fly()
    }
    
    public func performQuack() {
        quackBehavior?.quack()
    }
    
    public func swim() {
        print("All ducks float, even decoys")
    }
    
    public func setFlyBehavior(newBehavior: FlyStrategy) {
        flyBehavior = newBehavior
    }
    
    public func setQuackBehavior(newBehavior: QuackStrategy) {
        quackBehavior = newBehavior
    }
}
