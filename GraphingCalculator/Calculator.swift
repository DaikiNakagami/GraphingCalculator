//
//  Calculator.swift
//  GraphingCalculator
//
//  Created by Lihao Lin on 11/5/16.
//  Copyright © 2016 Lihao Lin. All rights reserved.
//

import Foundation


class Calculator {
    
    private var xMin: Double
    private var step: Double
    var xMax: Double {
        didSet {
            xMin = -xMax
            step = xMax / 100
        }
    }
    
    init() {
        xMin = 0.0
        xMax = 0.0
        step = 0.0
    }
    
    func plot(equation: String) -> [Point] {
        guard xMax != 0 else {
            return []
        }
        var line: [Point] = []
        for x in stride(from: xMin, to: xMax, by: step).dropFirst() {
            let point = plot(equation: equation, x: x)
            line.append(point)
        }
        return line
    }
    
    private func plot(equation: String, x: Double) -> Point {
        
//        let y = pow(x, 2)
//        let y = x
        let y = sin(x)
        
        return Point(_x: x, _y: y)
        
    }
    
    
}
