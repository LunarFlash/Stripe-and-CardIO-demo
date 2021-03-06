//
//  ViewController.swift
//  Donate
//
//  Created by Ziad TAMIM on 6/7/15.
//  Copyright (c) 2015 TAMIN LAB. All rights reserved.
//

import UIKit
import Stripe


class ViewController: UITableViewController,UITextFieldDelegate, CardIOPaymentViewControllerDelegate {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var cardNumberTextField: UITextField!
    @IBOutlet weak var expireDateTextField: UITextField!
    @IBOutlet weak var cvcTextField: UITextField!
    @IBOutlet weak var amountTextField: UITextField!
    @IBOutlet weak var spinner: UIActivityIndicatorView!
    
    @IBOutlet var textFields: [UITextField]!
    
    // MARK: - Text field delegate 
    
    
    
    override func viewDidLoad() {
        
        CardIOUtilities.preload()
        
    }
    
    
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        
        return true
    }
    
    
    // MARK: Actions
    
    @IBAction func donate(sender: AnyObject) {
        
        
        // Initiate the card
        var stripeCard = STPCard()
        
        // Split the expiration date to extract Month & Year
        if self.expireDateTextField.text!.isEmpty == false {
        
            let expirationDate = self.expireDateTextField.text!.componentsSeparatedByString("/")
            let expMonth = UInt(expirationDate[0])
            let expYear = UInt(expirationDate[1])
            
            
            // send card info to Stripe to get token
            stripeCard.number = self.cardNumberTextField.text
            stripeCard.cvc = self.cvcTextField.text
            stripeCard.expMonth = expMonth!
            stripeCard.expYear = expYear!
            
            
            
            
        
        
        }
        
        
        
    
    }
    
    
    
    
    @IBAction func scanBarButtonItemPressed(sender: AnyObject) {
        let cardIOVC = CardIOPaymentViewController(paymentDelegate: self)
        cardIOVC.modalPresentationStyle = .FormSheet
        cardIOVC.hideCardIOLogo = true
        
        
        presentViewController(cardIOVC, animated: true, completion: nil)
        
    }
    
    
    
    
    
    func userDidCancelPaymentViewController(paymentViewController: CardIOPaymentViewController!) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    func userDidProvideCreditCardInfo(cardInfo: CardIOCreditCardInfo!, inPaymentViewController paymentViewController: CardIOPaymentViewController!) {
        
        print("Received card info.")
        self.dismissViewControllerAnimated(true, completion: nil)
        
    }

}

