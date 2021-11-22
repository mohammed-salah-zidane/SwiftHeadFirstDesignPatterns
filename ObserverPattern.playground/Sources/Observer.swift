import Foundation

public protocol Observer: AnyObject {
    func update()
}

public protocol Displayable {
    func display()
}
