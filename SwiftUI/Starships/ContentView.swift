//
//  ContentView.swift
//  LabelA
//
//  Created by Jordy Wijman on 12/12/2019.
//  Copyright © 2019 Jordy Wijman. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var model = StarshipListViewModel()
    
    var body: some View {
        NavigationView {
            List(model.starships) { starship in
                NavigationLink(destination: DetailView(viewModel: starship)) {
                    VStack(alignment: .leading) {
                        Text(starship.title)
                        Text(starship.description).foregroundColor(.secondary).font(.system(size: 12))
                    }
                    .padding(3.8)
                }
            }
        .navigationBarTitle("Starships")
        }
    }
}

struct DetailView: View {
    let viewModel: StarshipViewModel
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(viewModel.starship.name)
            Text(viewModel.starship.model)
            Text(viewModel.starship.manufacturer)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
