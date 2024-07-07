//
//  SettingsView.swift
//  AZTH_Navigator
//
//  Created by Infinite Novice on 7/6/24.
//

import SwiftUI

struct SettingsView: View {
    @Environment(ModelData.self) var modelData
    
    var body: some View {
        @Bindable var modelData = modelData

        
        VStack {
            List(0..<1) { item in
                Toggle(isOn: $modelData.enableCallipers) {
                    Text("Enable Calliper Input")
                }
                .padding()
            }
        }

    }
}

#Preview {
    let modelData = ModelData()
    return SettingsView()
        .environment(modelData)
}
