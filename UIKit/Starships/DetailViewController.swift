//
//  DetailViewController.swift
//  LabelA - UIKit
//
//  Created by Jordy Wijman on 12/02/2020.
//  Copyright © 2020 Jordy Wijman. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    @IBOutlet var infoLabel: UILabel!
    var starship: Starship?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let starship = starship {
            infoLabel.text = "\(starship.name)\n\(starship.model)\n\(starship.manufacturer)"
        }
    }
    
    
}
