//
//  ViewController.swift
//  Prog2morgaiaFa16
//
//  Created by Bradley Morgan on 9/20/16.
//  Copyright © 2016 Eight Bit Software Co. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // outlets for capturing and manipulating text field input

    @IBOutlet weak var tfLoanAmount: UITextField!
    @IBOutlet weak var tfNumPayments: UITextField!
    @IBOutlet weak var tfInterestRate: UITextField!
    @IBOutlet weak var tfBalloonPayment: UITextField!
    @IBOutlet weak var lblPaymentAmount: UILabel!
    
    override func viewDidLoad() {
    
        super.viewDidLoad()
    
    }
    
    // main payment calculation function
    
    @IBAction func calculatePayment(sender: AnyObject) {
    
        let interestRate = Float(tfInterestRate.text!)
        let loanAmount = Double(tfLoanAmount.text!)
        let numPayments = Int(tfNumPayments.text!)
        var balloonPayment = Double(tfBalloonPayment.text!)
        
        // input validation
        
        if(numPayments == nil ||  numPayments! < 0) {
            
            presentViewController(createAlert("The number of payments must be a positive integer."), animated: true, completion: nil)
            
            return
            
        }
        
        if(interestRate == nil || interestRate < 0 || interestRate > 100) {
            
            presentViewController(createAlert("The interest rate must be a value between 0 and 100."), animated: true, completion: nil)
            
            return
            
        }
        
        if(loanAmount == nil || loanAmount < 0) {
            
            presentViewController(createAlert("Invalid loan amount."), animated: true, completion: nil)
            
            return
            
        }
        
        if(balloonPayment < 0 || balloonPayment > loanAmount) {
            
            presentViewController(createAlert("Invalid balloon payment amount."), animated: true, completion: nil)
            
            return
            
        } else if(balloonPayment == nil) {
            
            balloonPayment = 0.0
            
        }
        
        // if all input is valid, perform the payment calculation
    
        let interestRatePercentage = interestRate! / 100 // provided interest rate is 0 - 100 
        
        let netLoanAmount = Float(loanAmount!) - (Float(balloonPayment!) / pow((1 + interestRatePercentage), Float(numPayments!))) // calculate the loan amount taking into account the balloon payment
        
        let paymentAmount = ((interestRatePercentage * Float(netLoanAmount)) / (1 - pow((1 + interestRatePercentage),(Float(numPayments!) * -1))))
        
        //  display the result
        
        lblPaymentAmount.text = String(paymentAmount);
        
        
    }
    
    
    // function for abstracting validation alerts
    
    func createAlert(message: String) -> UIAlertController {
        
        let inputAlert:UIAlertController = UIAlertController(title: "Input Error", message: message, preferredStyle: UIAlertControllerStyle.Alert)
        
        let inputAlertAction:UIAlertAction = UIAlertAction(title: "Okay", style: UIAlertActionStyle.Cancel, handler: nil)
        
        inputAlert.addAction(inputAlertAction)
        
        return inputAlert
        
    }
    
    // gesture recognizer action to hide keyboard on tap
    
    @IBAction func hideNumberPad(sender: AnyObject) {
        
        self.view.endEditing(true)
        
    }

}

