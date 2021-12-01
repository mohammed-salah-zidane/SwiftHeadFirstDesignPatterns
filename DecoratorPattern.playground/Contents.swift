import UIKit

/*
 Define:-
  * The decorator pattern attach a new responsiblities dynamically to an object at runtime.
 
 Facts:-
  * Inheritance one ways of extensions but not the best way to achieve the flexbility in our desings.
  * In our desing we should allow behavior to be extended without need to modify our code.
  * Composition and delegation can often be used to add new behaviors at runtime.
  * The decorator pattern provide an alternative to subclassing for extend the behavior at runtime.
  * The decorator pattern is consist of concrate compenent (Object we nee to decorate) and decrator (the object that will add a new behavior to our component).
  * Decorators have the same type of the objects they decorate.
  * We can use any number of decorators to add new behaviors to our object.
  * Decorators can result in many small objects in our designs but overuse can be (Complex).
 
 - With decorator pattern we could know a new principle which is "Classes should open for extensions and closed for modifications".
 - "OPEN CLOSED" principle which allows classes to be easily extended at runtime with new behaviors witout modifying existing code.
 
 - Achieving "OPEN CLOSED" in decorator pattern by:-
  * add any type of responsiblities and behaviors at runtime without change the base class of our system.
 
 - Achieving "Identify what is varies and separete them" desing priciple in decorator pattern by:-
  * things that varies in decorators is the behaviors of our objects so it's seperated in its objects.
 
 
 - Achieving the lously coupling in decorator patten by:-
  * Our Concrate component don't know any thing about the objects that decorate it.
  * Add any type of behavior at any time.
  * Can reuse the concrate component and the decorator independantly of each other.
 */


/*
  Example:
   - We need to create a cofee system.
   - In this system clients can orders any cofee with some additional condiments.
   - The best solution here is using the decorator desing pattern to assign the additional condiments as the client need at runtime.
 */

//Concerate Copmonents.
class Expresso: BavarageCompenent {
    
    func getDescription() -> String {
       return "Expresso cofee, "
    }
    
    func cost() -> Double {
        return 1.99
    }
}

class HouseBlend: BavarageCompenent {
    
    func getDescription() -> String {
       return "HouseBlend cofee, "
    }
    
    func cost() -> Double {
        return 0.89
    }
}

// Decorators.

class MochaDecorator: BavarageCompenent {
    var component: BavarageCompenent
    
    init(_ component: BavarageCompenent) {
        self.component = component
    }
    
    func getDescription() -> String {
        return component.getDescription() + "Mocha, "
    }
    
    func cost() -> Double {
        return component.cost() + 0.20
    }
}

class WhipeDecorator: BavarageCompenent {
    var component: BavarageCompenent
    
    init(_ component: BavarageCompenent) {
        self.component = component
    }
    
    func getDescription() -> String {
        return component.getDescription() + "Whipe, "
    }
    
    func cost() -> Double {
        return component.cost() + 0.50
    }
}

var expressoBavarage = Expresso()

var houseblendWithMochaAndWhipe = WhipeDecorator(MochaDecorator(HouseBlend()))

print(expressoBavarage.getDescription() + "\(expressoBavarage.cost())")
print(houseblendWithMochaAndWhipe.getDescription() + "\(houseblendWithMochaAndWhipe.cost())")
