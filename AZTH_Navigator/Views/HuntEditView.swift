//
//  HuntEditView.swift
//  AZTH_Navigator
//
//  Created by Infinite Novice on 7/21/24.
//

import SwiftUI

struct HuntEditView: View {
    @Environment(HuntModel.self) var huntModel
//    @Environment(SettingsModel.self) var settingsModel
    @State var dateSelection = Date.now

    var body: some View {
        @Bindable var huntModel = huntModel
        
        Form {
            Section(header: Text("Hunt Information")) {
                DatePicker(selection: $huntModel.huntInfo.huntStartDate, label: { Text("Hunt Date") })
                TextField("Hunt Name", text: $huntModel.huntInfo.huntTitle)
                TextField("Hunt Theme", text: $huntModel.huntInfo.huntTheme)
                TextField("Car Number", text: $huntModel.huntInfo.carNumber)
                TextField("Team Name", text: $huntModel.huntInfo.teamName)
            }
            Section(header: Text("Team Members")) {
                ForEach($huntModel.huntInfo.teamMembers) { $member in
                    HStack {
                        TextField("Name", text: $member.name)
                            .frame(width: 200)
                        TextField("Phone Number", text: $member.phoneNumber)
                        Toggle(isOn: $member.iPhone) {
                            Text("iPhone")
                                .font(.title3)
                        }
                        .frame(width: 120)
                    }
                }
            }
        }
        .font(.title)
        .padding()
    }
    
}

#Preview {
    let huntModel = HuntModel()
    return HuntEditView()
        .environment(huntModel)
}
