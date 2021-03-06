//
//  HistoricalSitesTableViewController.swift
//  TheGrailDiary
//
//  Created by Phillip English on 10/19/15.
//  Copyright © 2015 The Iron Yard. All rights reserved.
//

import UIKit

class HistoricalSitesTableViewController: UITableViewController {
    
    var temples = Array<Temple>()

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Temples of Ancient Egypt"
        loadTemples()
       
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int
    {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        // #warning Incomplete implementation, return the number of rows
        return temples.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("TempleCell", forIndexPath: indexPath)

        // Configure the cell...
        let aTemple = temples[indexPath.row]
        cell.textLabel?.text = aTemple.name
        cell.detailTextLabel?.text = aTemple.deity
        
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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
     func loadTemples()
    {
        do
        {
            let filePath = NSBundle.mainBundle().pathForResource("temples", ofType: "json")
            let dataFromFile = NSData(contentsOfFile: filePath!)
            let templeData: NSArray! = try NSJSONSerialization.JSONObjectWithData(dataFromFile!, options: []) as! NSArray
            
            for templeDictionary in templeData
            {
                let aTemple = Temple(dictionary: templeDictionary as! NSDictionary)
                
                temples.append(aTemple)
            }
            temples.sortInPlace({ $0.name < $1.name})
            
        }
        catch let error as NSError
        {
            print(error)
        }
    } 

    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath)
    {
        let aTemple = temples[indexPath.row]
        let NVCfromTemplate = storyboard?.instantiateViewControllerWithIdentifier("TempleDetailViewController") as! TempleDetailViewController
        NVCfromTemplate.temple = aTemple
        presentViewController(NVCfromTemplate, animated: true, completion: nil)
    }
    
    
}
