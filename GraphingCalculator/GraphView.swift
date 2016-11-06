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
        for point in line {
            print("(\(point.x), \(point.y))")
        }
    }
    

}
