//
//  ModelData.swift
//  AZTH_Navigator
//
//  Created by Infinite Novice on 7/2/24.
//

import Foundation
import MapKit
import SwiftUI

@Observable
class ModelData {
    var calliperMarkers: [CalliperMarker] = []
    var markerID: Int = 0
    
    func newCalliperMarker(marker: CalliperMarker) {
        calliperMarkers.append(marker)
        print(calliperMarkers.count, markerID, marker.id)
        calliperMarkers[markerID].id = markerID
        markerID += 1
    }
    
    func clearCalliperMarkers() {
        calliperMarkers.removeAll()
        markerID = 0
    }
}
