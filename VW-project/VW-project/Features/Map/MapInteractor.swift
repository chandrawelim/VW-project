//
//  MapInteractor.swift
//  VW-project
//
//  Created by venazp on 09/04/20.
//  Copyright © 2020 Chandra Welim. All rights reserved.
//
//
//  VIPER Generator by Azisseno --  🐍 🐍 🐍 🐍
//

import Foundation

final class MapInteractor {
}

// MARK: - Extensions -
extension MapInteractor: MapInteractorInterface {
    func fetchVenues(_ completion: (([Venue]) -> Void)?) {
        guard let url = URL(string: "https://vinwonders-demo.herokuapp.com/venues") else {
            print("Invalid URL")
            return
        }
        let request = URLRequest(url: url)
        URLSession.shared.dataTask(with: request) { data, response, error in
            
            if let data = data {
                if let decodedResponse = try? JSONDecoder().decode([Venue].self, from: data) {
                    DispatchQueue.main.async {
                        completion?(decodedResponse)
                    }
                    return
                } else {
                    completion?(
                        [
                            Venue(id: 1, name: "Roller Coaster 1", image: "", visitorCount: 44),
                            Venue(id: 2, name: "Roller Coaster 2", image: "", visitorCount: 44)
                        ]
                    )
                }
            }
            
        }.resume()

    }
}
