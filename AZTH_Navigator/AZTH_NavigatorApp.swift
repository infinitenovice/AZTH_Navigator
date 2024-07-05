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
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .environment(modelData)
        .modelContainer(for: SiteMarker.self,
                        inMemory: false)
    }
}
