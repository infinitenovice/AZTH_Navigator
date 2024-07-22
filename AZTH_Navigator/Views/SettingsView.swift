//
//  SettingsView.swift
//  AZTH_Navigator
//
//  Created by Infinite Novice on 7/6/24.
//

import SwiftUI

struct SettingsView: View {
    @Environment(MapModel.self) var mapModel
    @Environment(CalliperModel.self) var calliperModel
    @Environment(SettingsModel.self) var settingsModel

    var body: some View {
        @Bindable var mapModel = mapModel
        @Bindable var calliperModel = calliperModel
        @Bindable var  settingsModel = settingsModel

        
        VStack {
            HuntInfoEditView()
//            DistributionListView()
//            AppManagementView()
        }
    }
}

#Preview {
    let settingsModel = SettingsModel()
    let calliperModel = CalliperModel()
    let mapModel = MapModel()
    return SettingsView()
        .environment(calliperModel)
        .environment(mapModel)
        .environment(settingsModel)
}
