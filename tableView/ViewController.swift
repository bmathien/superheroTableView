//
//  ViewController.swift
//  tableView
//
//  Created by Mathien on 1/12/16.
//  Copyright © 2016 Mathien. All rights reserved.
///Users/teacher/Desktop/superheroTableView/tableView/ViewController.swift

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate
{
    @IBOutlet weak var myTableView: UITableView!
    
    var superheros : [SuperHero] = []

    override func viewDidAppear(_ animated: Bool) {
        myTableView.reloadData()
    }

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
        superheros.append(SuperHero(Name: "Ironman", Alias: "Tony Stark", Power: 90, Image: UIImage(named: "IronMan")!))
        superheros.append(SuperHero(Name: "Aquaman", Alias: "Arther Allen", Power: 79, Image: UIImage(named: "aquaman")!))

        for element in superheros
        {
            print(element.name)
            print(element.alias)

        }
    }
    
    @IBAction func addButtonTapped(_ sender: AnyObject)
    {
        let myAlert = UIAlertController(title: "Add Superhero", message: nil, preferredStyle: .alert)
        
        
        myAlert.addTextField { (nameTextField) -> Void in
            nameTextField.placeholder = "Add Superhero Name"
        }
        
        myAlert.addTextField { (aliasTextField) -> Void in
            aliasTextField.placeholder = "Add Alias Name"
            aliasTextField.keyboardType = .numberPad
        }
        
        let addAction = UIAlertAction(title: "Add", style: .default) { (addAction) -> Void in
            let superheroNameTF = myAlert.textFields![0]
            let aliasTF = myAlert.textFields![1]
            self.superheros.append(SuperHero(Name: superheroNameTF.text!, Alias: aliasTF.text!))
            self.myTableView.reloadData()
        }
        myAlert.addAction(addAction)
        
        let cancelAction = UIAlertAction(title: "Cancel", style: UIAlertActionStyle.cancel, handler: nil)
        myAlert.addAction(cancelAction)
        
        
        present(myAlert, animated: true, completion: nil)
    }
    
    @IBAction func editButtonTapped(_ sender: UIBarButtonItem)
    {
        myTableView.isEditing = !myTableView.isEditing
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      
        // let cell = myTableView.dequeueReusableCellWithIdentifier("myCell")! as UITableViewCell
        let cell = myTableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath)
        cell.textLabel!.text = superheros[indexPath.row].name
        cell.detailTextLabel?.text = superheros[indexPath.row].alias
   
        return cell
    }

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return superheros.count
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath)
    {
        if editingStyle == .delete
        {
            superheros.remove(at: indexPath.row)
            myTableView.reloadData()
        }
    }
    
    func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool
    {
        return true
    }
    
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath)
    {
        let superhero = superheros[sourceIndexPath.row]
        superheros.remove(at: sourceIndexPath.row)
        superheros.insert(superhero, at: destinationIndexPath.row)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        let detailView = segue.destination as! DetailViewController
        let selectedRow = myTableView.indexPathForSelectedRow?.row
        
        detailView.superhero = superheros[selectedRow!]
        
    }
    



}

