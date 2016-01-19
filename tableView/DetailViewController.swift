//
//  DetailViewController.swift
//  tableView
//
//  Created by Mathien on 1/19/16.
//  Copyright © 2016 Mathien. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController
{
    @IBOutlet weak var myImageView: UIImageView!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var aliasTextField: UITextField!
    @IBOutlet weak var powerTextField: UITextField!
    
    var superhero : SuperHero!

    override func viewDidLoad()
    {
        super.viewDidLoad()

        nameTextField.text = superhero.name
        aliasTextField.text = superhero.alias
        powerTextField.text = String(superhero.power)
        myImageView.image = superhero.image
        
    }

    @IBAction func saveButtonTapped(sender: UIButton)
    {
        superhero.name = nameTextField.text!
        superhero.alias = aliasTextField.text!
        superhero.power = Int(powerTextField.text!)!
    }
    

}
