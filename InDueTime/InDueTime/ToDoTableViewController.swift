//
//  ToDoTableViewController.swift
//  InDueTime
//
//  Created by Phillip English on 10/20/15.
//  Copyright © 2015 The Iron Yard. All rights reserved.
//

import UIKit
import CoreData


class ToDoTableViewController: UITableViewController, UITextFieldDelegate
{

    let managedObjectContext = (UIApplication.sharedApplication().delegate as! AppDelegate).managedObjectContext
    var toDos = Array<ToDo>()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "To Do List"
        
        let fetchRequest = NSFetchRequest(entityName: "ToDo")
        
        do {
            let fetchResults = try managedObjectContext.executeFetchRequest(fetchRequest) as? [ToDo]
            toDos = fetchResults!
        }
        catch {
            let nserror = error as NSError
            NSLog("Unresolved error \(nserror), \(nserror.userInfo)")
            abort()
        }

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

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return toDos.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("ToDoCell", forIndexPath: indexPath) as! ToDoCell

        // Configure the cell...
        
        let aToDo = toDos[indexPath.row]
        
        if aToDo.toDoDescription == nil
        {
            cell.descriptionTextField.becomeFirstResponder()
        }
        else
        {
            cell.descriptionTextField.text = aToDo.toDoDescription
        }

        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath)
    {
        if editingStyle == .Delete
        {
            let aTodo = toDos[indexPath.row]
            if aTodo.isComplete == true
            {
                toDos.removeAtIndex(indexPath.row)
                managedObjectContext.deleteObject(aTodo)
                saveContext()
                tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)

            }
        }
        
    }
    

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
    
    //MARK: - UITextfield Delegate
    
    func textFieldShouldReturn(textField: UITextField) -> Bool
    {
        var rc = false
        
        if textField.text != ""
        {
            rc = true
            let contentView = textField.superview
            let cell = contentView?.superview as! ToDoCell
            let indexPath = tableView.indexPathForCell(cell)
            let aTodo = toDos[indexPath!.row]
            aTodo.toDoDescription = textField.text
            textField.resignFirstResponder()
            saveContext()
        }
        return rc
    }
    
    //MARK: - Action Handlers
    
    @IBAction func AddTablePushed(sender: UIBarButtonItem)
    {
        let newTodo = NSEntityDescription.insertNewObjectForEntityForName("ToDo", inManagedObjectContext: managedObjectContext) as! ToDo
        
        toDos.append(newTodo)
        tableView.reloadData()
    }
    
    
    @IBAction func isCompleteChanged(sender: UISwitch)
    {
        let contentView = sender.superview
        let cell = contentView?.superview as! ToDoCell
        let indexPath = tableView.indexPathForCell(cell)
        let aToDo = toDos[indexPath!.row]
        
        if Bool(sender.enabled) == false
        {
                        aToDo.isComplete == false
        }
        else
        {
            
            aToDo.isComplete == true
        }
        saveContext()
        tableView.reloadData()  
    }
    
    //MARK: - Private
    func saveContext()
    {
        do {
            try managedObjectContext.save()
        }
        catch {
            let nserror = error as NSError
            NSLog("Unresolved error \(nserror), \(nserror.userInfo)")
            abort()
        }
    }

}
