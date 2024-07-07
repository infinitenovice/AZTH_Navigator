//
//  AZTH_NavigatorApp.swift
//  AZTH_Navigator
//
//  Created by Infinite Novice on 6/18/24.
//

import SwiftUI
import SwiftData

@main
struct AZTH_NavigatorApp: App {
    @State private var modelData = ModelData()
    @State private var locationManager = LocationManager()
    var body: some Scene {
        WindowGroup {
            if locationManager.isAuthorized {
                ContentView()
            } else {
                LocationDeniedView()
            }
        }
        .environment(modelData)
        .environment(locationManager)
        .modelContainer(for: SiteMarker.self,
                        inMemory: false)
    }
}
