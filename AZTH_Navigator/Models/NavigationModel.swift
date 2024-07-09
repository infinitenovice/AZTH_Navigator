//
//  NavigationModel.swift
//  AZTH_Navigator
//
//  Created by Infinite Novice on 7/8/24.
//

import MapKit

@Observable
class NavigationModel {
    var targetDestination: MKPlacemark?
    var route: MKRoute?
    var routePolyline: MKPolyline?
    var routeInstructions: [String]?
 
    init() {
        self.targetDestination = nil
        self.route = nil
        self.routePolyline = nil
        self.routeInstructions = nil
    }
    
    func clearRoute() {
        self.targetDestination = nil
        self.route = nil
        self.routePolyline = nil
        self.routeInstructions = nil
    }
    
    
    func fetchRoute(locationManager: LocationManager) async {
        if let userLocation = locationManager.userLocation, let targetDestination = self.targetDestination {
            let request = MKDirections.Request()
            let startPlacemark = MKPlacemark(coordinate: userLocation.coordinate)
            let endPlacemark = MKPlacemark(coordinate: targetDestination.coordinate)
            let routeStart = MKMapItem(placemark: startPlacemark)
            let routeEnd = MKMapItem(placemark: endPlacemark)
            request.source = routeStart
            request.destination = routeEnd
            request.transportType = .automobile
            let directions = MKDirections(request: request)
            let result = try? await directions.calculate()
            route = result?.routes.first
            routePolyline = route?.polyline
        }
    }
    
    func stepInstruction() -> String {
        if let stepInstruction = route?.steps[1].instructions {
            return stepInstruction
        } else {
            return "No Route"
        }
    }
    
    func routeTime() -> String {
        if route != nil {
            let formatter = DateComponentsFormatter()
            formatter.allowedUnits = [.minute, .second]
            formatter.unitsStyle = .abbreviated
            return formatter.string(from: route!.expectedTravelTime)!
        } else {
            return "--m --s"
        }
    }
    
    func stepDistance(locationManager: LocationManager) -> String {
        var stepDistance: String = "--"
        if let userLocation = locationManager.userLocation {
//            let distance = userLocation.distance(from: routePolyline?.coordinate)
//            stepDistance = String(Int(distance * 3.28084))
        }
        return stepDistance + " ft"
    }
}
