/*
 - We need to create a duck game with various kinds of ducks
 - So here the best way is to make a superclass with the popular properties but it won't be the perfect way because the different kinds have different behaviors.
 - To solve this we should separate the changes behavior with generic protocols (interfaces) and create from these behaviors the customized kind then assign to the variables inherited from the superclass (Make a strategy for every behavior and assign it for every suitable kind)
 */

// Principles
// identify the aspects that vary in your application and then separete(incapsulate) them away
// when separete => program to interface not program to implementation (make it more generic)
// incapsulate and get the customized behavoir is composition so (Favor composiotion over inhertance)

                              /* The Solution for our problem will be STRATEGY PATTERN    */
/*
 defines a family of algorithms encapsulates each one and makes them interchangeable. strategy lets the algorithm (VARY) independently from clients that use it.
 */

import Foundation

class MallardDuck: Duck {
    override init() {
        super.init()
        setFlyBehavior(newBehavior: FlyWithWings())
        setQuackBehavior(newBehavior: Quack())
    }
}

var mallardDuck = MallardDuck()
mallardDuck.performQuack()
mallardDuck.performFly()
// Re-assign the behavior at runtim
mallardDuck.setFlyBehavior(newBehavior: FlyNoWay())
mallardDuck.performFly()

