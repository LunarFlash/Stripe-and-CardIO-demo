//
//  CardScanViewController.swift
//  Donate
//
//  Created by Terry Wang on 2/19/16.
//  Copyright © 2016 TAMIN LAB. All rights reserved.
//

import UIKit



class CardScanViewController: UIViewController, CardIOPaymentViewControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        
        CardIOUtilities.preload()
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    
    
    func userDidCancelPaymentViewController(paymentViewController: CardIOPaymentViewController!) {
        
    }
    
    func userDidProvideCreditCardInfo(cardInfo: CardIOCreditCardInfo!, inPaymentViewController paymentViewController: CardIOPaymentViewController!) {
        
        print("Received card info.")
        self.dismissViewControllerAnimated(true, completion: nil)
        
    }
    

}
