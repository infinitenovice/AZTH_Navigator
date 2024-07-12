//
//  MapModel.swift
//  AZTH_Navigator
//
//  Created by Infinite Novice on 7/2/24.
//

import MapKit
import SwiftUI

@Observable
class MapModel {
    var camera: MapCameraPosition
    var markerSelection: Int?
    var selectedMarkerLocation: CLLocationCoordinate2D?
 
    init() {
        camera = .region(GridRegion)
        self.markerSelection = nil
    }
    
    func region() -> MKCoordinateRegion {
        return camera.region ?? GridRegion
    }
    
    func sparkleZoom() {
        withAnimation {
            var region = self.region()
            if selectedMarkerLocation != nil {
                region.center = selectedMarkerLocation!
                region.span.longitudeDelta = 0
                region.span.latitudeDelta = 0
            } else {
                let zoomScale = 1.5
                region.span.longitudeDelta = zoomScale*MetersPerMile*DegreesPerMeterLon
                region.span.latitudeDelta = zoomScale*MetersPerMile*DegreesPerMeterLat
            }
            self.camera = .region(region)
        }
    }
    
    func gridZoom() {
        withAnimation {
            self.camera = .region(GridRegion)
        }
    }
}
