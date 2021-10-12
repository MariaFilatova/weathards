//
//  LocationService.swift
//  WeatherApp
//
//  Created by Waind Storm on 30.09.21.
//

import CoreLocation

class LocationService {
    static var shared: LocationService = LocationService()
    
    private let locationManager = CLLocationManager()
    
    func checkLocationServicesEnabled() -> Bool {
        return CLLocationManager.locationServicesEnabled()
    }
    
    func getLocationFor(_ city: String, completionHandler: @escaping (_ latitude: Double, _ longitude: Double) -> ()) {
        CLGeocoder().geocodeAddressString(city) { placemarks, error in
            if
                error == nil,
                let places = placemarks,
                let place = places.first,
                let lat = place.location?.coordinate.latitude,
                let lon = place.location?.coordinate.longitude {
                completionHandler(lat, lon)
            }
        }
    }
    
    func getCurrentLocation() {
        
    }
}
