//
//  ModalZipCodeViewController.swift
//  Forecaster
//
//  Created by Phillip English on 10/30/15.
//  Copyright © 2015 The Iron Yard. All rights reserved.
//

import UIKit

class ModalZipCodeViewController: UIViewController, UITextFieldDelegate
{

    @IBOutlet weak var zipCodeTextfield: UITextField!
    
    var delegate: modalZipCodeViewControllerDelegate?
    var location: String = ""
    var zipCode: String = ""

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.barTintColor = UIColor.purpleColor()
        // Do any additional setup after loading the view.
        zipCodeTextfield.becomeFirstResponder()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: -UITextFieldDelegate
    func textFieldShouldReturn(textField: UITextField) -> Bool
    {
        var rc = false
        
        if zipCodeTextfield.text != ""
        {
            zipCode = textField.text!
            textField.resignFirstResponder()
            rc = true
            delegate?.zipCodeWasChosen(zipCodeTextfield.text!)
        }
        print(textField.text) ; print(zipCode)
        
        return rc
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    func search(zip: String)
    {
        delegate?.zipCodeWasChosen(zip)
    }
    
    //MARK: - Action Handlers

    @IBAction func addCity(sender: UIButton)
    {
        search(zipCodeTextfield.text!)
        self.dismissViewControllerAnimated(true, completion: nil)
    }
}
