import Foundation

public protocol Subject: AnyObject {
    var observers: [Observer] {get set}
    func attach(_ observer: Observer)
    func detach(_ observer: Observer)
    func notifyObserver()
}
