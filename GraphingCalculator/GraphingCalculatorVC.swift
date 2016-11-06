//
//  GraphingCalculatorViewController.swift
//  GraphingCalculator
//
//  Created by Lihao Lin on 11/5/16.
//  Copyright © 2016 Lihao Lin. All rights reserved.
//

import UIKit

class GraphingCalculatorVC: UIViewController {

    @IBOutlet weak var graphView: GraphView!
    @IBOutlet weak var displayLabel: UILabel!
    
    let calculator = Calculator()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func digitPressed(_ sender: UIButton) {
        
        displayLabel.text = "\(displayLabel.text!)\(sender.titleLabel!.text!)"
        
    }
    
    @IBAction func operationPressed(_ sender: UIButton) {
        
        displayLabel.text = "\(displayLabel.text!)\(sender.titleLabel!.text!)"
        
    }
    
    @IBAction func clearPressed(_ sender: UIButton) {
        displayLabel.text = ""
    }
    
    @IBAction func drawEquation(_ sender: UIButton) {
        let line = calculator.plot(equation: "x^2", from: -300, to: 300, by: 0.5)
        graphView.line = line;
        
    }
    
    
}
