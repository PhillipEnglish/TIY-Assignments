//
//  SearchViewController.swift
//  VenueMenu
//
//  Created by Phillip English on 11/29/15.
//  Copyright © 2015 The Iron Yard. All rights reserved.
//

import UIKit
import CoreData

protocol FoursquareAPIResultsProtocol
{
    func didReceiveFoursquareAPIResults(results: NSDictionary)
}

class SearchViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UISearchBarDelegate, FoursquareAPIResultsProtocol
{
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet var tableView: UITableView!
    
    var delegate: VenueSearchDelegate
    var venues = [NSManagedObject]()
    var apiDelegate: APIController!

    override func viewDidLoad()
    {
        super.viewDidLoad()
        title = "Search"
        tableView.delegate = self
        tableView.dataSource = self
        searchBar.delegate = self

    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
    }
    
    // MARK: - Search Bar
    
    func searchBarSearchButtonClicked(searchBar: UISearchBar)
    {
        let term = searchBar.text
        UIApplication.sharedApplication().networkActivityIndicatorVisible = true
        searchQueryToAPIController(term!)
    }
    
    // MARK: - Foursquare API
    func searchQueryToAPIController(searchTerm: String)
    {
        self.apiDelegate = APIController(foursquareDelegate: self)
        apiDelegate.searchFoursquareFor(searchTerm)
    }
    
    func didReceiveFoursquareAPIResults(results: NSDictionary) {
        var venuesArray = [NSManagedObject]()
        venuesArray = Venue.searchResultsJSON(results)
        self.venues = venuesArray
        
        tableView.reloadData()
    }
    
    // MARK: - Table view data source
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int
    {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return venues.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        UIApplication.sharedApplication().networkActivityIndicatorVisible = false
        let cell = tableView.dequeueReusableCellWithIdentifier("SearchCell", forIndexPath: indexPath)
        let aVenue = venues[indexPath.row]
        
        cell.textLabel!.text = aVenue.valueForKey("name") as? String
        cell.detailTextLabel?.text = aVenue.valueForKey("address") as? String
        
        return cell
    }
    
    func tableView(tableView: UITableView, didDeselectRowAtIndexPath indexPath: NSIndexPath)
    {
        let venue = venues[indexPath.row]
        delegate.venueWasselected(venue)
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
