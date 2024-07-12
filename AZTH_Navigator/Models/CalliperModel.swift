//
//  CalliperModel.swift
//  AZTH_Navigator
//
//  Created by Infinite Novice on 6/30/24.
//

import SwiftUI
import MapKit

@Observable
class CalliperModel {
    var enable: Bool = true
    var markers: [CalliperMarker] = []
    @ObservationIgnored var markerID: Int = 0
    
    func newMarker(marker: CalliperMarker) {
        markers.append(marker)
        markers[markerID].id = markerID
        markerID += 1
    }
    
    func clearMarkers() {
        markers.removeAll()
        markerID = 0
    }
}

struct CalliperMarker: Identifiable {
    var id: Int = 0
    var center: CLLocationCoordinate2D = GridCenter
    var radius: Double = 0.0
}



