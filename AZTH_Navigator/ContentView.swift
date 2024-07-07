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
 - Add icloud
 - add Hunt Clocks
 - add Hunt Status
 - distribution list
 Maybe Do:
 - Delete Map Markers
 - Site marker notes
 - Mensurating cursor
 - zoom to selected marker
 - add westworld as a default marker
 - change grid-center zoom behavior
 - App start page
 - App icon
 Good enough for now:
 - add distribution MSG/mail
 - Calliper input/keyboard control
 - calliper distance displayed vs shading
 */

struct ContentView: View {
    var body: some View {
        ZStack {
            MapView()
        }
    }
}

#Preview {
    let config = ModelConfiguration(isStoredInMemoryOnly: true)
    let container = try! ModelContainer(for: SiteMarker.self, configurations: config)
    return ContentView()
        .environment(ModelData())
        .environment(LocationManager())
        .modelContainer(container)
}
