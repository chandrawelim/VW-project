//
//
//  MapPresenter.swift
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

final class MapPresenter {

    var shownDataId: Int = 0
    
    // MARK: - Default properties -
    private weak var _view: MapViewInterface?
    private var _interactor: MapInteractorInterface
    private var _router: MapRouterInterface?

    // MARK: - Module Setup -
    init(_ interactor: MapInteractorInterface, _ router: MapRouterInterface) {
        _interactor = interactor
        _router = router
    }

    func set(_ view: MapViewInterface) {
        _view = view
    }

}

// MARK: - Extensions -
extension MapPresenter: MapPresenterInterface {
    func annotationDidSelect(_ data: VenuePin) {
        _view?.showFloatingView()
        shownDataId = data.venue.id
        _view?.setFloatingViewValue(data)
    }
    
    func annotationDidDeselect(_ data: VenuePin) {
        _view?.hideFloatingView()
    }
    
    func viewDidLoad() {
        
        _interactor.fetchVenues { [weak self] data in
            guard let `self` = self else { return }
            let result = self._generateDataSource(data)
            self._view?.showAnnotations(result)
        }
        Timer.scheduledTimer(withTimeInterval: 1,
                             repeats: true) { [weak self] _ in
                                self?._interactor.fetchVenues { [weak self] data in
                                    guard let `self` = self else { return }
                                    let result = self._generateDataSource(data)
                                    if self.shownDataId > 0 {
                                        let venuePin = result.filter { $0.venue.id == self.shownDataId }[0]
                                        self._view?.setFloatingViewValue(venuePin)
                                    }
                                }
        }
        
    }
    
    func _generateDataSource(_ data: [Venue]) -> [VenuePin] {
        var lat: Double = 10.341654
        var lon: Double = 103.850257
        return data.map { venue in
            lat += 0.002
            lon += 0.002
            let location = CLLocationCoordinate2D(latitude: lat, longitude: lon)
            return VenuePin(venue: venue,
                            coordinate: location,
                            metersAway: 5,
                            typeVenue: "Extreme Hills")
        }
    }
}
