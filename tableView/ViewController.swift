//
//  ViewController.swift
//  tableView
//
//  Created by Mathien on 1/12/16.
//  Copyright © 2016 Mathien. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    @IBOutlet weak var myTableView: UITableView!
    var superheros = ["Superman", "Batman", "Spiderman", "Flash", "Hulk", "Ironman"]
    var realName = ["Clark Kent", "Bruce Wayne", "kfdslk", "Barry", "Bruce Banner", "Tony Stark"]


    override func viewDidLoad()
    {
        super.viewDidLoad()
        myTableView.dataSource = self
        myTableView.delegate = self
    }
    
    @IBAction func addButtonTapped(sender: AnyObject)
    {
        let myAlert = UIAlertController(title: "Add Superhero", message: nil, preferredStyle: .Alert)
        
        
        myAlert.addTextFieldWithConfigurationHandler { (nameTextField) -> Void in
            nameTextField.placeholder = "Add Superhero Name"
        }
        
        myAlert.addTextFieldWithConfigurationHandler { (aliasTextField) -> Void in
            aliasTextField.placeholder = "Add Alias Name"
        }
        
        let addAction = UIAlertAction(title: "Add", style: .Default) { (addAction) -> Void in
            let superheroNameTF = myAlert.textFields![0] as UITextField
            let aliasTF = myAlert.textFields![1] as UITextField
            self.superheros.append(superheroNameTF.text!)
            self.realName.append(aliasTF.text!)
            self.myTableView.reloadData()
        }
        myAlert.addAction(addAction)
        
        let cancelAction = UIAlertAction(title: "Cancel", style: UIAlertActionStyle.Cancel, handler: nil)
        myAlert.addAction(cancelAction)
        
        
        self.presentViewController(myAlert, animated: true, completion: nil)
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
      
        // let cell = myTableView.dequeueReusableCellWithIdentifier("myCell")! as UITableViewCell
        let cell = myTableView.dequeueReusableCellWithIdentifier("myCell", forIndexPath: indexPath)
        cell.textLabel!.text = superheros[indexPath.row]
        cell.detailTextLabel?.text = realName[indexPath.row]
   
        return cell
    }

    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return superheros.count
    }
    
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath)
    {
        if editingStyle == .Delete
        {
            superheros.removeAtIndex(indexPath.row)
            realName.removeAtIndex(indexPath.row)
            myTableView.reloadData()
        }
    }
    
    func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool
    {
        return true
    }
    



}

