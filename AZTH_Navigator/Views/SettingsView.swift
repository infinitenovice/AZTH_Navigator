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

    var body: some View {
        @Bindable var mapModel = mapModel
        @Bindable var calliperModel = calliperModel

        
        ScrollView {
            VStack(spacing: 20) {
                HuntEditView()
                    .frame(height: 700)
                AppManagementView()
                    .frame(height: 700)
            }
        }
    }
}

#Preview {
    let huntModel = HuntModel()
    let calliperModel = CalliperModel()
    let mapModel = MapModel()
    return SettingsView()
        .environment(calliperModel)
        .environment(mapModel)
        .environment(huntModel)
}
