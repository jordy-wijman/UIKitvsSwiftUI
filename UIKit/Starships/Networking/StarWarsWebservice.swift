//
//  Webservice.swift
//  LabelA
//
//  Created by Jordy Wijman on 12/12/2019.
//  Copyright © 2019 Jordy Wijman. All rights reserved.
//

import Foundation

class StarWarsWebservice {
    private let baseUrl = "https://swapi.co/api";
    
    func starships(completion: @escaping ([Starship]?) -> ()) {
        guard let url = URL(string: "\(baseUrl)/starships") else {
            fatalError("Url could not be generated")
        };
        print(url)
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            print(data, response, error)
            guard let data = data, error == nil else {
                completion(nil)
                return
            }
            
            let response = try? JSONDecoder().decode(StarshipResponse.self, from: data);
            if let response = response {
                DispatchQueue.main.async {
                    completion(response.results)
                }
            }
        }.resume()
    }
}
