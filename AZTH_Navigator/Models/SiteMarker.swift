//
//  ClueMarker.swift
//  AZTH_Navigator
//
//  Created by Infinite Novice on 6/25/24.
//

import SwiftData
import SwiftUI
import MapKit

@Model
class SiteMarker: Identifiable {
    var id: Int
    var latitude: Double
    var longitude: Double
    var clueLetterIndex: Int
    var statusIndex: Int
    var label: String


    init(id: Int, latitude: Double, longitude: Double) {
        self.id = id
        self.latitude = latitude
        self.longitude = longitude
        self.clueLetterIndex = 0
        self.statusIndex = 0
        self.label = ""
    }
 
    
    var coordinate: CLLocationCoordinate2D {
        .init(latitude: latitude, longitude: longitude)
    }
}

let SiteStatus: [String] = [
        "Possible Site",
        "Found",
        "Found (Emergency)",
        "Found (Out Of Order)",
        "Starting Clue"
    ]

let ClueLetters: [String] = [
    "?","A","B","C","D","E","F","G","H","I","J","K","L","M",
    "N","O","P","Q","R","S","T","U","V","W","X","Y","Z","JA"
]
