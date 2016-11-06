//
//  GraphingCalculatorViewController.swift
//  GraphingCalculator
//
//  Created by Lihao Lin on 11/5/16.
//  Copyright © 2016 Lihao Lin. All rights reserved.
//

import UIKit

class GraphingCalculatorVC: UIViewController {

    let calculator = Calculator()
    var range:Float! {
        didSet {
            calculator.xMax = Double(range * 100)
            graphView.xMax = Double(range * 100)
        }
    }
    
    @IBOutlet weak var graphView: GraphView!
    @IBOutlet weak var displayLabel: UILabel!
    @IBOutlet weak var rangeSlider: UISlider!
    @IBAction func rangeValueChanged(_ sender: UISlider) {
        range = sender.value
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        range = rangeSlider.value
    }
    
    @IBAction func digitPressed(_ sender: UIButton) {
        
        displayLabel.text = "\(displayLabel.text!)\(sender.titleLabel!.text!)"
        
    }
    
    @IBAction func operationPressed(_ sender: UIButton) {
        
        displayLabel.text = "\(displayLabel.text!)\(sender.titleLabel!.text!)"
        
    }
    
    @IBAction func clearPressed(_ sender: UIButton) {
        displayLabel.text = ""
        graphView.line = []
    }
    
    @IBAction func drawEquation(_ sender: UIButton) {
        let line = calculator.plot(equation: "x^2")
        graphView.line = line;
        
    }
    
    
}
