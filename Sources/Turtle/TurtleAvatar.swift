import UIKit

public class TurtleAvatar: UIView {
    public var heading = 0.0 // North
    var label: UILabel?
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder:aDecoder)
        self.label = UILabel(coder:aDecoder)
    }
    public override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.clear
        self.label = UILabel(frame: frame)
        self.label?.text = "🐢"
        self.label?.transform = CGAffineTransform(rotationAngle: (.pi / 2) )
        self.addSubview(self.label!)
    }
    
    public override func draw(_ rect: CGRect) {
        // Draw the turtle avatar based on the heading...
        let triangle = UIBezierPath()
        triangle.move(to: CGPoint(x: rect.width / 2, y: rect.height / 8))
        triangle.addLine(to: CGPoint(x: rect.width / 2 + (rect.width * 5 / 8 / sqrt(3.0)), y: rect.height / 4 * 3))
        triangle.addLine(to: CGPoint(x: rect.width / 2 - (rect.width * 5 / 8 / sqrt(3.0)), y: rect.height / 4 * 3))
        triangle.close()
        
        UIColor.black.setStroke()
        UIColor.white.setFill()
        triangle.fill()
        triangle.stroke()
        super.draw(rect)
        
    }
}


