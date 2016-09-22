//
//  ViewController.swift
//  Prog2morgaiaFa16
//
//  Created by Bradley Morgan on 9/20/16.
//  Copyright © 2016 Eight Bit Software Co. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tfLoanAmount: UITextField!
    @IBOutlet weak var tfNumPayments: UITextField!
    @IBOutlet weak var tfInterestRate: UITextField!
    @IBOutlet weak var tfBalloonPayment: UITextField!
    @IBOutlet weak var lblPaymentAmount: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func calculatePayment(sender: AnyObject) {
    
    // P = ( r * A ) / ( 1 - (1+r)-N)
        let interestRate = Double(tfInterestRate.text!)!
        let loanAmount = Double(tfLoanAmount.text!)!
        let numPayments = Int(tfNumPayments.text!)!
        
        let paymentAmount = Double((interestRate * loanAmount) / (1 - pow((1 + interestRate),(Double(numPayments) * -1))))
        
        lblPaymentAmount.text = String(paymentAmount);
        
        self.view.resignFirstResponder()
        
    }
    


}

