import Foundation
import UIKit

public class Turtle {
    var name: String?
    var tag: Int? // This is assigned when we're added to the TurtleView
    // For those properties that make sense to simply assign we do? Maybe?
    var penColor: UIColor!// {
//        get {
//            return self.penColor
//        }
//        set(newColor) {
//            let command = TurtleCommand.setcolor(newColor)
//            commandStack.append(command)
//        }
//    }
    var backgroundColor: UIColor! //{
//        get {
//            return self.backgroundColor
//        }
//        set(newColor) {
//            let command = TurtleCommand.setbg(newColor)
//            commandStack.append(command)
//        }
//    }
    var penSize: Float! //{
//        get {
//            return self.penWidth
//        }
//        set(newWidth) {
//            let command = TurtleCommand.setpensize(newWidth)
//            commandStack.append(command)
//        }
//    }
    
    var heading: Float!
    var penState = PenState.pendown
    var isTurtleVisible = true

    var speed: Float!
    var commandStack = [TurtleCommand]()
    let avatar = TurtleAvatar(frame:CGRect(x:0,y:0, width:30, height:30))
    
    public var currentPoint: CGPoint!
    
    public init(name: String?) {
        self.name = name
        self.penColor = .black
        self.backgroundColor = .white
        self.penSize = 2.0
        self.speed = 1.0
        self.heading = 0.0 // By default we will be heading "up"
        self.currentPoint = CGPoint(x: 0.0, y:0.0)
    }
    
    public func forward(distance: Float) {
        let command = TurtleCommand.forward(distance)
        commandStack.append(command)
    }

    public func backward(distance: Float) {
        let command = TurtleCommand.backward(distance)
        commandStack.append(command)
    }
    
    public func right(turnDegrees: Float) {
        let command = TurtleCommand.right(turnDegrees)
        commandStack.append(command)
    }

    public func left(turnDegrees: Float) {
        let command = TurtleCommand.left(turnDegrees)
        commandStack.append(command)
    }

    public func home() {
        let command = TurtleCommand.home
        commandStack.append(command)
    }

    public func setColor(color: UIColor) {
        let command = TurtleCommand.setcolor(color)
        commandStack.append(command)
    }

    public func setBackgroundColor(color: UIColor) {
        let command = TurtleCommand.setbg(color)
        commandStack.append(command)
    }

    public func penUp() {
        let command = TurtleCommand.penup
        commandStack.append(command)
    }

    public func penDown() {
        let command = TurtleCommand.pendown
        commandStack.append(command)
    }
    
    public func penErase() {
        let command = TurtleCommand.penerase
        commandStack.append(command)
    }
    
    public func hide() {
        let command = TurtleCommand.hide
        commandStack.append(command)
    }

    public func show() {
        let command = TurtleCommand.show
        commandStack.append(command)
    }
    
    public func setPenSize(penSize: Float) {
        let command = TurtleCommand.setpensize(penSize)
        commandStack.append(command)
    }

    public func north() {
        let command = TurtleCommand.north
        commandStack.append(command)
    }
    
    public func south() {
        let command = TurtleCommand.south
        commandStack.append(command)
    }
    
    public func east() {
        let command = TurtleCommand.east
        commandStack.append(command)
    }
    
    public func west() {
        let command = TurtleCommand.west
        commandStack.append(command)
    }
    
}

// This is different than the xLogo project because instead of pre-calculating
// the positions we'll do that when it's time to draw. This may not be a great
// idea, but we'll see how it works out.
enum TurtleCommand {
    case forward(Float)
    case backward(Float)
    case right(Float)
    case left(Float)
    case home
    case setcolor(UIColor)
    case setbg(UIColor)
    case penup
    case pendown
    case penerase
    case hide
    case show
    case setpensize(Float)
    case north
    case south
    case east
    case west
}

enum PenState {
    case pendown
    case penup
    case penerase
}
