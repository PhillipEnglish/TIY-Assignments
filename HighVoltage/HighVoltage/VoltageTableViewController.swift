//
//  VoltageTableViewController.swift
//  HighVoltage
//
//  Created by Phillip English on 10/22/15.
//  Copyright © 2015 The Iron Yard. All rights reserved.
//

import UIKit

protocol TypesListTableViewControllerDelegate
{
    func typeWasChosen(chosenType: String)
}

class VoltageTableViewController: UITableViewController, UIPopoverPresentationControllerDelegate, TypesListTableViewControllerDelegate

{

   var visibleTypes = [String]()
    
    var remainingTypes = ["watts", "volts", "amps", "ohms"]
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Danger! High VOLTAGE!"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return visibleTypes.count   
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("VoltageCell", forIndexPath: indexPath)

        // Configure the cell...

        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?)
    {
        if segue.identifier == "ShowTypesListPopoverSegue"
        {
            let destVC = segue.destinationViewController as! TypesListTableViewController
            destVC.types = remainingTypes
            destVC.popoverPresentationController?.delegate = self
            let contentHeight = 44.0 * CGFloat(remainingTypes.count)
            destVC.delegate = self
            destVC.preferredContentSize = CGSizeMake(200, contentHeight)
        }
    
    }

    //MARK:  UIPopoverPresentationController Delegate
    func adaptivePresentationStyleForPresentationController(controller: UIPresentationController) -> UIModalPresentationStyle
    {
        return .None
    }
    
    
    //MARK: - TypesListTableViewController Delegate
    func typeWasChosen(chosenType: String)
    {
        navigationController?.dismissViewControllerAnimated(true, completion: nil)
        visibleTypes.append(chosenType)
        let rowToRemove = (remainingTypes as NSArray).indexOfObject(chosenType)
        remainingTypes.removeAtIndex(rowToRemove)
        
        tableView?.reloadData() 
    }

}
