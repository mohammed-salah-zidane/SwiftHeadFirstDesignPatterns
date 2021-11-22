import UIKit

/*
 Define:- the observer pattern defines 1-to-many dependancy (relationship) between set of objects when the state object change all of its dependancies notified with the change

 - With observer pattern we could know a new principle which is "Strive for loosly coupled desings between objects that interact".
 
 "LOUSLY COUPLING" principle which mean "loosly coupled desings allow to create flexible systems that can hanlde any change because they menimize the interdependacy between objects"
 
 - Achieving the lously coupling in observer patten by:-
   * The subject know the way of relation with the other observers (only) which is implementing the observer interface.
   * Add any type of observer at any time.
   * No need to update the subject class to add new observer.
   * Can reuse the subject and observer independantly of each other.
   * Change to each subject or observer will not affect each other.
 
 
 - Achieving "Identify what is varies and separete them" desing priciple by:-
   * The thing that varies in the observer is the state of the subject and the number and types of observers that the subject contains.
   * by this pattern we can vary the objects that are dependent on the state of the subject without change the subject itself.
  
 - Achieving "Program to interface not an implementation" by:-
   * Observer and subject implemnts its own interfaces.
   * Subject use its interface to keeps track the state of the registerd observers.
   * Observer use its interface to register for the update from the subject.
 
 - Achieving "Favor composition(has-a) over inheritance(is-a)" by:-
   * Observer pattern compose any number of observers with thier subjects.
   * This relationship aren't setup by some kind of inheritance (is-a concept) but setup at runtime by compsition (has-a concept).
   * This relationship is easy to modified later (change the behavior and remove the observers).
   * Pulling pattern to update the observer by it needed info not all the data that some of it might be unneeded/
 */


//=========================================================Example======================================================================

class WeatherData: Subject {
    var observers: [Observer]
    private var temperature: Double
    private var pressure: Double
    private var humidity: Double
    
    init() {
        observers = []
        temperature = 0
        pressure = 0
        humidity = 0
    }

    func attach(_ observer: Observer) {
        observers.append(observer)
    }
    
    func detach(_ observer: Observer) {
        observers = observers.filter( { $0 === observer })
    }
    
    func notifyObserver() {
        observers.forEach({ $0.update() })
    }
    
    func measurementsChanged() {
        notifyObserver()
    }
    
    func setHumidityMeasurement(humidity: Double) {
        self.humidity = humidity
        measurementsChanged()
    }
    
    func setTemperatureMeasurement(temp: Double) {
        self.temperature = temp
        measurementsChanged()
    }
    
    func setPressureMeasurement(pressure: Double) {
        self.pressure = pressure
        measurementsChanged()
    }

    func getTemperature() -> Double {
        temperature
    }
    
    func getHumidity() -> Double {
        humidity
    }
    
    func getPressure() -> Double {
        pressure
    }
    
    func displayNumberOfSubscribers() {
        print("Number of weather data subscriptions is \(observers.count) listener")
    }
}


class CurrentCondiationDisplay: Observer, Displayable {
    var weatherData: WeatherData
    var temperature : Double = 0
    var humidity : Double = 0
    
    init(subject: WeatherData) {
        self.weatherData = subject
    }
    
    func update() {
        self.temperature = weatherData.getTemperature()
        self.humidity = weatherData.getHumidity()
    }
    
    func display() {
        print("Current Condition is \(temperature) C degrees \(humidity) % humidity")
    }
}

class CurrentPressureDisplay: Observer, Displayable {
    var weatherData: WeatherData
    var pressure : Double = 0
    
    init(subject: WeatherData) {
        self.weatherData = subject
    }
    
    func update() {
        self.pressure = weatherData.getPressure()
    }
    
    func display() {
        print("Current pressure is \(pressure)")
    }
}


let subject = WeatherData()

let conditionDisplay = CurrentCondiationDisplay(subject: subject)

let pressureDisplay = CurrentPressureDisplay(subject: subject)

subject.attach(conditionDisplay)
subject.attach(pressureDisplay)
subject.setTemperatureMeasurement(temp: 37)
subject.setHumidityMeasurement(humidity: 5)
subject.setPressureMeasurement(pressure: 20)

subject.displayNumberOfSubscribers()

conditionDisplay.display()
pressureDisplay.display()

subject.detach(pressureDisplay)

subject.displayNumberOfSubscribers()


/*
 Console Results
 
 Number of weather data subscriptions is 2 listener
 Current Condition is 37.0 C degrees 5.0 % humidity
 Current pressure is 20.0
 Number of weather data subscriptions is 1 listener
 
 */
