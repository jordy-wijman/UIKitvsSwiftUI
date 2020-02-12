//
//  ViewController.swift
//  LabelA - UIKit
//
//  Created by Jordy Wijman on 12/02/2020.
//  Copyright © 2020 Jordy Wijman. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    var selectedStarship: Starship?
    
    var starships = [Starship]()
    let webservice = StarWarsWebservice()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.navigationBar.prefersLargeTitles = true
        webservice.starships { starships in
            if let starships = starships {
                print("I am getting here so my starships are being filled :)", starships.count)
                self.starships += starships
                self.tableView.reloadData()
                return
            }
            
            print("For some reason it couldn't send me an array of starships back :c")
        }
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return starships.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "starshipCell", for: indexPath)
        cell.textLabel?.text = starships[indexPath.row].name
        cell.detailTextLabel?.text = starships[indexPath.row].manufacturer
        cell.detailTextLabel?.textColor = .secondaryLabel
        cell.accessoryType = .disclosureIndicator
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedStarship = starships[indexPath.row]
        performSegue(withIdentifier: "starshipSegue", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "starshipSegue" {
            let detailView = segue.destination as! DetailViewController
            detailView.starship = selectedStarship
        }
    }
}

