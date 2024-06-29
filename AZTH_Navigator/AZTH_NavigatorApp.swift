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
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: SiteMarker.self,
                        inMemory: true)
    }
}
