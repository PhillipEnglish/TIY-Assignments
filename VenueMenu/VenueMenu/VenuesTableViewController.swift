//
//  VenuesTableViewController.swift
//  VenueMenu
//
//  Created by Phillip English on 11/29/15.
//  Copyright © 2015 The Iron Yard. All rights reserved.
//

import UIKit
import CoreData

protocol VenueSearchDelegate
{
    func venueWasselected(venue: NSManagedObject)
}

class VenuesTableViewController: UITableViewController, VenueSearchDelegate
{
    var venues = Array<NSManagedObject>()
    let managedObjectContext = (UIApplication.sharedApplication().delegate as! AppDelegate).managedObjectContext
    
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        let fetchRequest = NSFetchRequest(entityName: "Venue")
        do {
            let fetchResults = try managedObjectContext.executeFetchRequest(fetchRequest) as? [Venue]
            venues = fetchResults!
        }
        catch {
            let nserror = error as NSError
            NSLog("Unresolved error \(nserror), \(nserror.userInfo)")
            abort()
        }
        
        self.navigationItem.leftBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int
    {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        
        return venues.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCellWithIdentifier("VenueCell", forIndexPath: indexPath)

        let aVenue = venues[indexPath.row]
        cell.textLabel?.text = aVenue.valueForKey("name") as? String
        return cell
    }

    
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool
    {
        return true
    }
    
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath)
    {
        if editingStyle == .Delete
        {
            let aVenue = venues[indexPath.row]
            venues.removeAtIndex(indexPath.row)
            managedObjectContext.deleteObject(aVenue)
            saveContext()
            
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Automatic)
        }
    }

  // MARK: - Private functions
    
    private func saveContext()
    {
        do
        {
            try managedObjectContext.save()
        }
        catch
        {
            let nserror = error as NSError
            NSLog("Unresolved error \(nserror), \(nserror.userInfo)")
            abort()
        }
    }
    
    
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
