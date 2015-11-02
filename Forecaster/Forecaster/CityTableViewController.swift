//
//  CityTableViewController.swift
//  Forecaster
//
//  Created by Phillip English on 10/29/15.
//  Copyright © 2015 The Iron Yard. All rights reserved.
//

import UIKit

protocol modalZipCodeViewControllerDelegate
{
    func zipCodeWasChosen(zipCode: String)
}

protocol CityAPIControllerProtocol
{
    func didReceiveMapsAPIResults(results: NSDictionary)
}

class CityTableViewController: UITableViewController, modalZipCodeViewControllerDelegate, CityAPIControllerProtocol
{
    var cities = [City]()

    var cityAPI: CityAPIController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Forecaster"
        
        zipCodeWasChosen("32801")
        
        //Coloring
        navigationController?.navigationBar.barTintColor = UIColor.purpleColor()
        //self.tableView.backgroundColor = UIColor.lightGrayColor()
       
        
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
    
    //TableCell Coloring
    override func tableView(tableView: UITableView, willDisplayCell cell: UITableViewCell, forRowAtIndexPath indexPath: NSIndexPath) {
        cell.backgroundColor = UIColor.clearColor()
    }

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return cities.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("CityCell", forIndexPath: indexPath) as! CityWeatherTableViewCell
        
       let aCity = cities[indexPath.row]
        
        cell.cityLabel?.text = aCity.city
        
      
        
        // Configure the cell...
        //cell.textLabel!.text = "Orlando"
        //cell.detailTextLabel?.text = "79 Degrees"
        

        return cell
    }
    
    // MARK: - API Controller Protocols
    
    func didReceiveMapsAPIResults(results: NSDictionary)
    {
        dispatch_async(dispatch_get_main_queue(), {
            let aCity = City.cityWithJSON(results)
            self.cities.append(aCity)
            
            self.tableView.reloadData()
        })
    }
    
    
    // MARK: - Loction Delegate
    func zipCodeWasChosen(zipCode: String)
    {
        print(zipCode)
        
        
        UIApplication.sharedApplication().networkActivityIndicatorVisible = true
        
        self.cityAPI = CityAPIController(cityDelegate: self)
        
        cityAPI.searchGoogleForCity(zipCode)
        tableView.reloadData()
        navigationController?.dismissViewControllerAnimated(true, completion: nil)
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

   
}
