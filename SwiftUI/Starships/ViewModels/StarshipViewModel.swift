//
//  StarshipViewModel.swift
//  LabelA
//
//  Created by Jordy Wijman on 12/12/2019.
//  Copyright © 2019 Jordy Wijman. All rights reserved.
//

import Foundation

class StarshipViewModel: Identifiable {
    let id = UUID()
    let starship: Starship
    
    init(starship: Starship) {
        self.starship = starship
    }
    
    var title: String {
        return starship.name
    }
    
    var description: String {
        return starship.manufacturer
    }
}
