//
//  Calculator.swift
//  GraphingCalculator
//
//  Created by Lihao Lin on 11/5/16.
//  Copyright © 2016 Lihao Lin. All rights reserved.
//

import Foundation


class Calculator {
    
    func plot(equation: String, from xMin: Double, to xMax: Double, by step: Double) -> [Point] {
        var line: [Point] = []
        for x in stride(from: xMin, to: xMax, by: step).dropFirst() {
            let point = plot(equation: equation, x: x)
            line.append(point)
        }
        return line
    }
    
    private func plot(equation: String, x: Double) -> Point {
        
        let y = pow(x, 2)
        
        return Point(_x: x, _y: y)
        
    }
    
    
}
