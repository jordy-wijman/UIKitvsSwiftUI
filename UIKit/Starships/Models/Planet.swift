//
//  Planet.swift
//  LabelA
//
//  Created by Jordy Wijman on 12/12/2019.
//  Copyright © 2019 Jordy Wijman. All rights reserved.
//

import Foundation

struct Planet: Codable {
    let name, rotationPeriod, orbitalPeriod, diameter: String
    let climate, gravity, terrain, surfaceWater: String
    let population: String
    let films, residents: [String]
    let created, edited: String
    let url: String

    enum CodingKeys: String, CodingKey {
        case name
        case rotationPeriod = "rotation_period"
        case orbitalPeriod = "orbital_period"
        case diameter, climate, gravity, terrain
        case surfaceWater = "surface_water"
        case population, residents, films, created, edited, url
    }
}
