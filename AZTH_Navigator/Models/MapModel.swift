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
 
    init() {
        camera = .region(GridRegion)
        self.markerSelection = nil
    }
    
    func region() -> MKCoordinateRegion {
        return camera.region ?? GridRegion
    }
    
    func sparkleZoom() {
        var region = self.region()
        region.span.longitudeDelta = 2*Mile*DegreesPerMeterLon
        region.span.latitudeDelta = 2*Mile*DegreesPerMeterLat
        self.camera = .region(region)
    }
    
    func gridZoom() {
        self.camera = .region(GridRegion)
    }
}
