//
//  MapInterfaces.swift
//  VW-project
//
//  Created by venazp on 09/04/20.
//  Copyright © 2020 Chandra Welim. All rights reserved.
//
//
//  VIPER Generator by Azisseno --  🐍 🐍 🐍 🐍
//

import UIKit
import MapKit

class VenuePin: NSObject, MKAnnotation {
    var venue: Venue
    var coordinate: CLLocationCoordinate2D
    var metersAway: Int
    var typeVenue: String
    
    init(venue: Venue,
         coordinate: CLLocationCoordinate2D,
         metersAway: Int,
         typeVenue: String) {
        self.venue = venue
        self.coordinate = coordinate
        self.metersAway = metersAway
        self.typeVenue = typeVenue
    }
}

enum MapNavigationOption {
}

protocol MapRouterInterface: class {
    func set(_ view: MapViewController)
    func navigate(to option: MapNavigationOption)
}

protocol MapViewInterface: class {
    func showAnnotations(_ data: [VenuePin])
    func showFloatingView()
    func hideFloatingView()
    func setFloatingViewValue(_ data: VenuePin)
}

protocol MapPresenterInterface: class {
    init(_ interactor: MapInteractorInterface, _ router: MapRouterInterface)
    func set(_ view: MapViewInterface)
    func viewDidLoad()
    func annotationDidSelect(_ data: VenuePin)
    func annotationDidDeselect(_ data: VenuePin)
}

protocol MapInteractorInterface: class {
    func fetchVenues(_ completion: (([Venue]) -> Void)?)
}
