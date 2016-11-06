//
//  GraphView.swift
//  GraphingCalculator
//
//  Created by Lihao Lin on 11/5/16.
//  Copyright © 2016 Lihao Lin. All rights reserved.
//

import UIKit

class GraphView: UIView {
    
    let calculator = Calculator()
    private var scale: CGFloat = 0.0
    
    var equation: String = "" {
        didSet {
            line = calculator.plot(equation: equation)
        }
    }
    
    private var line: [Point] = [] {
        didSet {
            setNeedsDisplay()
        }
    }
    
    var xMax: Double = 0.0 {
        didSet {
            scale = bounds.width / 2 / CGFloat(xMax)
            calculator.xMax = xMax
            line = calculator.plot(equation: equation)
            setNeedsDisplay()
        }
    }
    
    func drawEquation(equation: String) {
        self.equation = equation
    }
    
    override func draw(_ rect: CGRect) {
        drawAxes()
        guard line.count > 0 && equation != "" else {
            return
        }
        let path = UIBezierPath()
        path.lineWidth = 5
        path.lineCapStyle = .round
        
        var startingPoint = line.first!.makeCGPointFor(view: self, scale: scale)
        var endingPoint: CGPoint!
        
        for point in line {
            endingPoint = point.makeCGPointFor(view: self, scale: scale)
            path.move(to: startingPoint)
            path.addLine(to: endingPoint)
            startingPoint = endingPoint
            
        }
        path.stroke()
    }
    
    private func drawAxes() {        
        let path = UIBezierPath()
        let arrowSize:CGFloat = 10
        // x-axis
        path.move(to: CGPoint(x: 0, y: center.y))
        path.addLine(to: CGPoint(x: bounds.width, y: center.y))
        // arrow right
        path.addLine(to: CGPoint(x: bounds.width - arrowSize, y: center.y - arrowSize))
        path.move(to: CGPoint(x: bounds.width, y: center.y))
        path.addLine(to: CGPoint(x: bounds.width - arrowSize, y: center.y + arrowSize))

        // y-axis
        path.move(to: CGPoint(x: center.x, y: bounds.height))
        path.addLine(to: CGPoint(x: center.x, y: 0))
        // arrow up
        path.addLine(to: CGPoint(x: center.x + arrowSize, y: 0 + arrowSize))
        path.move(to: CGPoint(x: center.x, y: 0))
        path.addLine(to: CGPoint(x: center.x - arrowSize, y: 0 + arrowSize))
        
        path.stroke()
    }

}

extension Point {
    func makeCGPointFor(view: UIView, scale: CGFloat) -> CGPoint {
        let center = view.center
        let x = center.x + CGFloat(self.x) * scale
        let y = center.y - CGFloat(self.y) * scale
        let point = CGPoint(x: x, y: y)
        return point
    }
}
