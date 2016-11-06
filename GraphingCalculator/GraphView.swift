//
//  GraphView.swift
//  GraphingCalculator
//
//  Created by Lihao Lin on 11/5/16.
//  Copyright © 2016 Lihao Lin. All rights reserved.
//

import UIKit

class GraphView: UIView {
    
    var line: [Point] = [] {
        didSet {
            setNeedsDisplay()
        }
    }
    
    override func draw(_ rect: CGRect) {
        guard line.count > 0 else {
            return
        }
        let path = UIBezierPath()
        path.lineWidth = 5
        
        var startingPoint = line.first!.makeCGPointFor(view: self)
        var endingPoint: CGPoint!
        
        for point in line {
            endingPoint = point.makeCGPointFor(view: self)
            
            path.move(to: startingPoint)
            path.addLine(to: endingPoint)
            startingPoint = endingPoint
            
        }
        path.stroke()
    }
    

}

extension Point {
    func makeCGPointFor(view: UIView) -> CGPoint {
//        let bounds = view.bounds
        let center = view.center
//        let ratio = bounds.height / bounds.width
        let x = center.x + CGFloat(self.x)
        let y = center.y - CGFloat(self.y)
        return CGPoint(x: x, y: y)
    }
}
