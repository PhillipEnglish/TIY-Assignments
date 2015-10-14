//
//  QuickPickTableViewController.swift
//  Jackpot
//
//  Created by Phillip English on 10/13/15.
//  Copyright © 2015 The Iron Yard. All rights reserved.
//

import UIKit

class QuickPickTableViewController: UITableViewController
{
    var quickPickTableArray = Array<String>()
    var ticketNumber = 1
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

     loadNumbers()
       
     
        
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
        
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return quickPickTableArray.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("quickPickCell", forIndexPath: indexPath)

        // Configure the cell...
        let aQuickPick = quickPickTableArray[indexPath.row]
        cell.textLabel?.text = String(aQuickPick)

        return cell
    }
    


    //@IBAction func testFunc(Sender: UIBarButtonItem) 
    
    @IBAction func addButton(sender: UIBarButtonItem)
    {
   
        loadNumbers()
        
        // listening to Keron    let newPath = NSIndexPath(forRow: quickPickTableArray.count, inSection: 0)
        
        
        //Create Ticket
        //Add ticket to array
        //loadNumbers()
    }
    
    // MARK: - Private
    
    private func loadNumbers()
    {
        let aNumber = LottoNumbers()
        quickPickTableArray.append("\(ticketNumber): \(aNumber.toString())")
        ticketNumber++
        tableView.reloadData()
    }
    
}
