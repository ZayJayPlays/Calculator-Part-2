//
//  ViewController.swift
//  Calculator
//
//  Created by Zane Jones on 1/20/23.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var displayedNumber: UILabel!
    @IBOutlet var numberButtons: UIButton!
    
    var currentFirstNumber: Double?
    var currentSecondNumber: Double?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func changeDisplay(_ sender: UIButton) {
        displayedNumber.text! += sender.titleLabel?.text ?? "0"
    }
    
    @IBAction func clear(_ sender: Any) {
        displayedNumber.text = ""
        currentFirstNumber = nil
        currentSecondNumber = nil
    }
    @IBAction func percentValue(_ sender: Any) {
        if displayedNumber.text != "" {
            displayedNumber.text = String(Double(displayedNumber.text!)! * 0.01)
        }
        
    }
    
    @IBAction func changePositivity(_ sender: Any) {
        if displayedNumber.text != "" {
            if floor(Double(displayedNumber.text!)!) == Double(displayedNumber.text!) {
                displayedNumber.text = String(Int(displayedNumber.text!)! * -1)
            }
            else {
                displayedNumber.text = String(Double(displayedNumber.text!)! * -1)
            }
        }
    }
    @IBAction func equate(_ sender: Any) {
        let expression = NSExpression(format: displayedNumber.text ?? "0")
        let result = (expression.expressionValue(with: nil, context: nil) as! Double)
        displayedNumber.text = displayResults(result: result)
    }
    func displayResults(result: Double) -> String {
        if result.truncatingRemainder(dividingBy: 1) == 0 {
            return String(format: "%.0f", result)
        }
        else {
            return String(format: "%.2f", result)
        }
    }
}

