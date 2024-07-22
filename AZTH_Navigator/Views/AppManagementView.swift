//
//  AppManagementView.swift
//  AZTH_Navigator
//
//  Created by Infinite Novice on 7/17/24.
//

import SwiftUI
import SwiftData

struct AppManagementView: View {
    @Environment(\.modelContext) private var modelContext
    @State var enableManagement: Bool = false

    var body: some View {
        List {
            Section(header: Text("App Management")) {
                Toggle(isOn: $enableManagement) {
                    Text("Enable Management Functions")
                }

                if enableManagement {
                    Button {
                        do {
                            try modelContext.delete(model: SiteMarker.self)
                        } catch {
                            print(error.localizedDescription)
                        }
                    } label: {
                        Text("Clear all site markers")
                    }
                }
            }
        }
    }
}

#Preview {
    let settingsModel = SettingsModel()
    let calliperModel = CalliperModel()
    let mapModel = MapModel()
    let navigationModel = NavigationModel()
    let locationManager = LocationManager()
    let config = ModelConfiguration(isStoredInMemoryOnly: true)
    let container = try! ModelContainer(for: SiteMarker.self, configurations: config)
    return AppManagementView()
        .environment(settingsModel)
        .environment(calliperModel)
        .environment(mapModel)
        .environment(navigationModel)
        .environment(locationManager)
        .modelContainer(container)
}
