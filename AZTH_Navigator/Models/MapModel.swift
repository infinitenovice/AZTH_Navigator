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
    let maxZoom: MKCoordinateSpan = MKCoordinateSpan(latitudeDelta: 0.00155, longitudeDelta: 0.003038)
    let gridCellZoom: MKCoordinateSpan = MKCoordinateSpan(latitudeDelta: MetersPerMile*DegreesPerMeterLat, longitudeDelta: 1.25*MetersPerMile*DegreesPerMeterLon)

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
                region.span = maxZoom
            } else {
                region.span = gridCellZoom
            }
            self.camera = .region(region)
        }
    }
    
    func gridZoom() {
        withAnimation {
            var region = self.region()
            if region.span.longitudeDelta == GridRegion.span.longitudeDelta {
                self.camera = .region(GridRegion)
            } else {
                region.span = GridRegion.span
                self.camera = .region(region)
            }
        }
    }
}
