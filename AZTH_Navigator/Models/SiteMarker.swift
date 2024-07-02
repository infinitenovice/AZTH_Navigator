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

struct SiteStatus {
    var status: String
    var color: Color
}

let siteStatus: [SiteStatus] = [
    SiteStatus(status: "Possible Site",         color: Color.purple),
    SiteStatus(status: "Found",                 color: Color.blue),
    SiteStatus(status: "Found (Emergency)",     color: Color.yellow),
    SiteStatus(status: "Found (Out Of Order)",  color: Color.teal),
    SiteStatus(status: "Starting Clue",         color: Color.green),
    SiteStatus(status: "Jackass",               color: Color.red)
    ]

let ClueLetters: [String] = [
    "?","A","B","C","D","E","F","G","H","I","J","K","L","M",
    "N","O","P","Q","R","S","T","U","V","W","X","Y","Z","JA"
]
