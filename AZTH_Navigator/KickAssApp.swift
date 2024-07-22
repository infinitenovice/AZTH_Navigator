//
//  AZTH_NavigatorApp.swift
//  AZTH_Navigator
//
//  Created by Infinite Novice on 6/18/24.
//

import SwiftUI
import SwiftData

@main
struct KickAssApp: App {
    @State private var mapModel = MapModel()
    @State private var locationManager = LocationManager()
    @State private var navigationModel = NavigationModel()
    @State private var calliperModel = CalliperModel()
    @State private var huntModel = HuntModel()
    var body: some Scene {
        WindowGroup {
            if locationManager.isAuthorized {
                ContentView()
            } else {
                LocationDeniedView()
            }
        }
        .environment(huntModel)
        .environment(calliperModel)
        .environment(navigationModel)
        .environment(mapModel)
        .environment(locationManager)
        .modelContainer(for: SiteMarker.self,
                        inMemory: false)
    }
}
