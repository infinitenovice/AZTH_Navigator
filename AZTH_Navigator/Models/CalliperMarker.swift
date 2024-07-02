//
//  CalliperModel.swift
//  AZTH_Navigator
//
//  Created by Infinite Novice on 6/30/24.
//

import SwiftUI
import MapKit

struct CalliperMarker: Identifiable {
    var id: Int = 0
    var center: CLLocationCoordinate2D = grid.center
    var radius: Double = 0.0
}



