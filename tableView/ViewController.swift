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
    
    var superheros : [SuperHero] = []


    override func viewDidLoad()
    {
        super.viewDidLoad()
        myTableView.dataSource = self
        myTableView.delegate = self
        
        superheros.append(SuperHero(Name: "Superman", Alias: "Clark Kent", Power: 95, Image: UIImage(named: "superman")!))
        superheros.append(SuperHero(Name: "Batman", Alias: "Bruce Wayne", Power: 84, Image: UIImage(named: "batman")!))
        superheros.append(SuperHero(Name: "Spiderman", Alias: "Peter Parker", Power: 92, Image: UIImage(named: "spiderman")!))
        superheros.append(SuperHero(Name: "The Flash", Alias: "Barry Allen", Power: 88, Image: UIImage(named: "flash")!))
        superheros.append(SuperHero(Name: "The Hulk", Alias: "Bruce Banner", Power: 80, Image: UIImage(named: "hulk")!))
        superheros.append(SuperHero(Name: "Ironman", Alias: "Tony Stark", Power: 90, Image: UIImage(named: "ironman")!))
        superheros.append(SuperHero(Name: "Aquaman", Alias: "Arther Allen", Power: 79, Image: UIImage(named: "aquaman")!))

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
            let superheroNameTF = myAlert.textFields![0]
            let aliasTF = myAlert.textFields![1]
            self.superheros.append(SuperHero(Name: superheroNameTF.text!, Alias: aliasTF.text!))
            self.myTableView.reloadData()
        }
        myAlert.addAction(addAction)
        
        let cancelAction = UIAlertAction(title: "Cancel", style: UIAlertActionStyle.Cancel, handler: nil)
        myAlert.addAction(cancelAction)
        
        
        self.presentViewController(myAlert, animated: true, completion: nil)
    }
    
    @IBAction func editButtonTapped(sender: UIBarButtonItem)
    {
        myTableView.editing = !myTableView.editing
    }
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
      
        // let cell = myTableView.dequeueReusableCellWithIdentifier("myCell")! as UITableViewCell
        let cell = myTableView.dequeueReusableCellWithIdentifier("myCell", forIndexPath: indexPath)
        cell.textLabel!.text = superheros[indexPath.row].name
        cell.detailTextLabel?.text = superheros[indexPath.row].alias
   
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
            myTableView.reloadData()
        }
    }
    
    func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool
    {
        return true
    }
    
    func tableView(tableView: UITableView, moveRowAtIndexPath sourceIndexPath: NSIndexPath, toIndexPath destinationIndexPath: NSIndexPath)
    {
        let superhero = superheros[sourceIndexPath.row]
        superheros.removeAtIndex(sourceIndexPath.row)
        superheros.insert(superhero, atIndex: destinationIndexPath.row)
    }
    



}

