//
//  ContentView.swift
//  AZTH_Navigator
//
//  Created by Infinite Novice on 6/18/24.
//

import SwiftUI
import SwiftData
import MapKit

/*
 To Do:
 - Add Navigation
    - Test step functionality with live location data
 - add Hunt Clocks
 - add Hunt Status
 - App icon
 - App start page
 - add westworld as a default marker
 - add path recording
 - refactor settings, distribution list
 Maybe Do:
 - add settings toggle for route step markers
 - add heading indicator
 - add error circles around selected marker
 - Delete Map Markers
 - Site marker notes
 Possible Future Improvements
 - Add icloud to support simultaneous users
 - Mensurating cursor
 - hunt data archiving
 */

struct ContentView: View {
    
    
    var body: some View {
        ZStack {
            MapView()
        }
    }
}

#Preview {
    let huntModel = HuntModel()
    let calliperModel = CalliperModel()
    let mapModel = MapModel()
    let navigationModel = NavigationModel()
    let locationManager = LocationManager()
    let config = ModelConfiguration(isStoredInMemoryOnly: true)
    let container = try! ModelContainer(for: SiteMarker.self, configurations: config)
    return ContentView()
        .environment(huntModel)
        .environment(calliperModel)
        .environment(mapModel)
        .environment(navigationModel)
        .environment(locationManager)
        .modelContainer(container)
}
