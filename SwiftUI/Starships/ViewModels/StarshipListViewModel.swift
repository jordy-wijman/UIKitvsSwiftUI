//
//  StarshipListViewModel.swift
//  LabelA
//
//  Created by Jordy Wijman on 12/12/2019.
//  Copyright © 2019 Jordy Wijman. All rights reserved.
//

import Foundation

class StarshipListViewModel: ObservableObject {
    init() {
        fetchStarships()
    }
    
    @Published
    var starships: [StarshipViewModel] = []
    
    private func fetchStarships() {
        StarWarsWebservice().starships() { starships in
            if let starships = starships {
                self.starships = starships.map(StarshipViewModel.init)
            }
        }
    }
}
