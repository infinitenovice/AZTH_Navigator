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

        
        VStack {
            List(0..<1) { item in
                Toggle(isOn: $calliperModel.enable) {
                    Text("Enable Calliper Input")
                }
                .padding()
            }
        }

    }
}

#Preview {
    let calliperModel = CalliperModel()
    let mapModel = MapModel()
    return SettingsView()
        .environment(calliperModel)
        .environment(mapModel)
}
