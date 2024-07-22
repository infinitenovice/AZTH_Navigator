//
//  HuntInitializationView.swift
//  AZTH_Navigator
//
//  Created by Infinite Novice on 7/21/24.
//

import SwiftUI

struct HuntInfoEditView: View {
    @Environment(HuntInfoModel.self) var huntInfoModel
//    @Environment(SettingsModel.self) var settingsModel
    @State var dateSelection = Date.now

    var body: some View {
        @Bindable var huntInfoModel = huntInfoModel
        
        Form {
            Section(header: Text("Hunt Information")) {
                TextField("Hunt Name", text: $huntInfoModel.huntInfo.huntTitle)
                DatePicker(selection: $huntInfoModel.huntInfo.huntStartDate, label: { Text("Hunt Date") })
            }
            
        }
        .font(.title)
        .padding()
        .onSubmit {
            huntInfoModel.save()
        }
        .onChange(of: huntInfoModel.huntInfo.huntStartDate) { oldValue, newValue in
            print(huntInfoModel.huntInfo.huntStartDate)
            huntInfoModel.save()
        }
    }
    
}

#Preview {
    let settingsModel = SettingsModel()
    let huntInfoModel = HuntInfoModel()
    return HuntInfoEditView()
        .environment(huntInfoModel)
        .environment(settingsModel)
}
