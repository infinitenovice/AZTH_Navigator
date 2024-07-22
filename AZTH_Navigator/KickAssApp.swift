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
    @State private var settingsModel = SettingsModel()
    @State private var huntInfoModel = HuntInfoModel()
    var body: some Scene {
        WindowGroup {
            if locationManager.isAuthorized {
                ContentView()
            } else {
                LocationDeniedView()
            }
        }
        .environment(huntInfoModel)
        .environment(settingsModel)
        .environment(calliperModel)
        .environment(navigationModel)
        .environment(mapModel)
        .environment(locationManager)
        .modelContainer(for: SiteMarker.self,
                        inMemory: false)
    }
}
