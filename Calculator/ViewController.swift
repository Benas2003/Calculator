//
//  ViewController.swift
//  Calculator
//
//  Created by Benas Kubilius on 2022-06-01.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        Result.text = "";
        // Do any additional setup after loading the view.
    }
    
    @IBOutlet weak var Result: UILabel!
    
    var workings:String = "";
    var previousNumber:Double = 0.00
    var mathOperator:String = "";
    var currentNumber:Double = 0.00;
    var result:Double = 0.00;
    
    func addToWorkings(value: String)
    {
        workings = workings + value;
        Result.text = workings;
    }
    
    func getOperator(givenOperator: String)
    {
        mathOperator = givenOperator;
        if !workings.isEmpty
        {
            previousNumber = Double(workings)!;
        }
        
        workings = "";
        Result.text = workings;
    }
    
    func calculateResult()
    {
        if !workings.isEmpty{
            currentNumber = Double(workings)!;
        }else{
            previousNumber = result;
        }
        workings = "";
        
        if(mathOperator=="+")
        {
            result = previousNumber + currentNumber;
        }
        else if (mathOperator=="-"){
            result = previousNumber - currentNumber;
        }
        else if (mathOperator=="*"){
            result = previousNumber * currentNumber;
        }else{
            result = previousNumber / currentNumber;
        }
        
        result = round(result * 100) / 100.0;
        
        
        Result.text = String(format: "%.2f", result);
    }
    
    func convertToPercent()
    {
        var number:Double = 0;
        if !workings.isEmpty{
            number = Double(workings)!
        }
        number = number / 100;
        previousNumber = number;
        Result.text = String(format: "%.2f", number);
        print (number)
    }
    
    func ClearNumber()
    {
        workings = "";
        Result.text = "";
    }
    
    func ClearAll()
    {
        previousNumber = 0.00;
        mathOperator = ""
        workings = "";
        Result.text = "";
        NSLog("I deleting the whole memory");
    }

    
    
    @IBAction func Clear(_ sender: Any) {
        if(workings=="")
        {
            ClearAll();
        }
        ClearNumber();
    }

    @IBAction func Negative(_ sender: Any) {
        if workings.contains("-")
        {
            if let i = workings.firstIndex(of: "-") {
                workings.remove(at: i) // i is character index
            }
            Result.text = workings;
        }
        else{
            workings = "-" + workings;
            Result.text = workings;
        }
    }
    @IBAction func Percent(_ sender: Any) {
        convertToPercent();
    }
    @IBAction func Divide(_ sender: Any) {
        getOperator(givenOperator: "/")
    }
    @IBAction func Times(_ sender: Any) {
        getOperator(givenOperator: "*")
    }
    @IBAction func Minus(_ sender: Any) {
        getOperator(givenOperator: "-")
    }
    @IBAction func Plus(_ sender: Any) {
        getOperator(givenOperator: "+")
    }
    @IBAction func Equal(_ sender: Any) {
        calculateResult()
    }
    @IBAction func Comma(_ sender: Any) {
        addToWorkings(value: ".");
    }
    @IBAction func Zero(_ sender: Any) {
        addToWorkings(value: "0");
    }
    @IBAction func One(_ sender: Any) {
        addToWorkings(value: "1");
    }
    @IBAction func Two(_ sender: Any) {
        addToWorkings(value: "2");
    }
    @IBAction func Three(_ sender: Any) {
        addToWorkings(value: "3");
    }
    @IBAction func Four(_ sender: Any) {
        addToWorkings(value: "4");
    }
    @IBAction func Five(_ sender: Any) {
        addToWorkings(value: "5");
    }
    @IBAction func Six(_ sender: Any) {
        addToWorkings(value: "6");
    }
    @IBAction func Seven(_ sender: Any) {
        addToWorkings(value: "7");
    }
    @IBAction func Eight(_ sender: Any) {
        addToWorkings(value: "8");
    }
    @IBAction func Nine(_ sender: Any) {
        addToWorkings(value: "9");
    }
}

