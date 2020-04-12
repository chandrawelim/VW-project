//
//  MapViewController.swift
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
import CoreLocation

final class MapViewController: UIViewController {

    @IBOutlet weak var mapView: MKMapView!
    fileprivate var _locationManager: CLLocationManager = CLLocationManager()
    var models: [VenuePin] = []
    var floatingViewIsAnimating: Bool = false
    
    // Floating View
    @IBOutlet weak var venueNameLabel: UILabel!
    @IBOutlet weak var counterLabel: UILabel!
    @IBOutlet weak var clockLabel: UILabel!
    @IBOutlet weak var pinLabel: UILabel!
    @IBOutlet weak var fireLabel: UILabel!
    @IBOutlet weak var venueImageView: UIImageView!
    @IBOutlet weak var floatingView: UIView!
    @IBOutlet weak var botFloatingConstraint: NSLayoutConstraint!
    
    // MARK: - Default properties -
    private var _presenter: MapPresenterInterface!
    
    // MARK: - Module Setup -
    init?(coder: NSCoder, presenter: MapPresenterInterface) {
        _presenter = presenter
        super.init(coder: coder)
    }
    
    required init?(coder: NSCoder) {
        fatalError("(coder: NSCoder) has not been implemented")
    }
    
    // MARK: - View Controller Lifecycle -
    override func viewDidLoad() {
        super.viewDidLoad()
        _setupView()
    }
	
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        _presenter.viewDidLoad()
        _setNavBar()
    }
    
    // MARK: - Setup Initial View
    private func _setupView() {
        
        // Location Set up
        _locationManager.requestWhenInUseAuthorization()
        _locationManager.desiredAccuracy = kCLLocationAccuracyBest
        _locationManager.distanceFilter = kCLDistanceFilterNone
        _locationManager.startUpdatingLocation()
        
        // MapKit Set up
        let viewWonderLoc = CLLocation(latitude: 10.341654, longitude: 103.850257)
        mapView.centerToLocation(viewWonderLoc)
        let region = MKCoordinateRegion(center: viewWonderLoc.coordinate,
                                        latitudinalMeters: 50000,
                                        longitudinalMeters: 60000)
        mapView.setCameraBoundary(
            MKMapView.CameraBoundary(coordinateRegion: region),
            animated: true)
        
        let zoomRange = MKMapView.CameraZoomRange(maxCenterCoordinateDistance: 7000)
        mapView.setCameraZoomRange(zoomRange, animated: true)
        mapView.showsUserLocation = true
        mapView.register(VenuePin.self, forAnnotationViewWithReuseIdentifier: "pin")
        mapView.delegate = self
    }

    private func _setNavBar() {
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
}

// MARK: - Extensions -
extension MapViewController: MapViewInterface {
    
    func showFloatingView() {
        let delay: Double = botFloatingConstraint.constant == -170 && floatingViewIsAnimating ? 0.12 : 0
        botFloatingConstraint.constant = 20
        UIView.animate(withDuration: 0.15, delay: delay, options: .curveEaseIn, animations: {
            self.floatingViewIsAnimating = true
            self.view.layoutIfNeeded()
        }, completion: { [weak self] _ in
            self?.botFloatingConstraint.constant = 12
            UIView.animate(withDuration: 0.15, animations: {
                self?.view.layoutIfNeeded()
            }) { _ in
                self?.floatingViewIsAnimating = false
            }
        })
    }
    
    func hideFloatingView() {
        botFloatingConstraint.constant = -170
        UIView.animate(withDuration: 0.1, delay: 0, options: .curveEaseOut, animations: {
            self.floatingViewIsAnimating = true
            self.view.layoutIfNeeded()
        }, completion: { [weak self] _ in
            self?.floatingViewIsAnimating = false
        })
    }
    
    func setFloatingViewValue(_ data: VenuePin) {
        _setFloatingView(venueName: data.venue.name,
                         timeLeft: "5 mins",
                         pinText: "500m away",
                         fireText: "Extreme Thrill",
                         imageURL: URL(string: "https://vinwonders-demo.herokuapp.com\(data.venue.image)")!,
                         counterText: "\(data.venue.visitorCount)")
    }
    
    func showAnnotations(_ data: [VenuePin]) {
        mapView.addAnnotations(data)
    }
    
    private func _setFloatingView(venueName: String,
                                  timeLeft: String,
                                  pinText: String,
                                  fireText: String,
                                  imageURL: URL,
                                  counterText: String) {
        venueNameLabel.text = venueName
        clockLabel.text = timeLeft
        pinLabel.text = pinText
        fireLabel.text = fireText
        counterLabel.text = counterText
    }
}

extension MapViewController: MKMapViewDelegate {
    func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {
        if view.reuseIdentifier == "MKMapViewDefaultAnnotationViewReuseIdentifier" {
            print("TAP")
            let venuePin = view.annotation as! VenuePin
            _presenter.annotationDidSelect(venuePin)
        }
    }
    
    func mapView(_ mapView: MKMapView, didDeselect view: MKAnnotationView) {
        if view.reuseIdentifier == "MKMapViewDefaultAnnotationViewReuseIdentifier" {
            print("DESELECT")
            let venuePin = view.annotation as! VenuePin
            _presenter.annotationDidDeselect(venuePin)
        }
    }
}

private extension MKMapView {
    func centerToLocation(_ location: CLLocation,
                          regionRadius: CLLocationDistance = 1000) {
    let coordinateRegion = MKCoordinateRegion(
        center: location.coordinate,
        latitudinalMeters: regionRadius,
        longitudinalMeters: regionRadius)
        setRegion(coordinateRegion, animated: true)
    }
}
