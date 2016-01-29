//
//  EntryViewController.swift
//  FirstContact
//
//  Created by Phillip English on 11/20/15.
//  Copyright © 2015 The Iron Yard. All rights reserved.
//

import UIKit
import RealmSwift

class EntryViewController: UIViewController, UITextFieldDelegate
{

    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var phoneField: UITextField!
    @IBOutlet weak var birthdayField: UITextField!
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        self.nameField.delegate = self
        self.phoneField.delegate = self
        self.birthdayField.delegate = self
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Action Handlers
    @IBAction func saveButtonPushed(sender: UIButton)
    {
        saveContact()
        self.navigationController?.popToRootViewControllerAnimated(true)
    }
    
    func saveContact()
    {
        let aContact = Contact()
        aContact.name = nameField.text!
        aContact.phoneNumber = phoneField.text!
        aContact.birthDay = birthdayField.text!
        
        do
        {
            let realm = try Realm()
            try realm.write({ () -> Void in
                realm.add(aContact)
                print("Contact Saved")
            })
        }
        catch
        {
            
        }
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    // MARK: - Textfield Delegate
    func textFieldShouldReturn(textField: UITextField) -> Bool
    {   //delegate method
        textField.resignFirstResponder()
        return true
    }

}
