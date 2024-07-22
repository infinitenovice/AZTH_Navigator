//
//  DistributionListView.swift
//  AZTH_Navigator
//
//  Created by Infinite Novice on 7/17/24.
//

import SwiftUI

struct DistributionListView: View {
    @Environment(SettingsModel.self) var settingsModel

    var body: some View {
        @Bindable var  settingsModel = settingsModel

        List {
            Section(header: Text("Distribution List")) {
                ForEach($settingsModel.DistributionList) { $recipient in
                        TextField("Phone Number", text: $recipient.phoneNumber)
                    }
                    .onDelete(perform: { indexSet in
                        settingsModel.DistributionList.remove(atOffsets: indexSet)
                })
                Button {
                    let new = Recipient.init(phoneNumber: "")
                    settingsModel.DistributionList.append(new)
                    print(settingsModel.DistributionList.count)
                } label: {
                    Text("Add Recipient")
                }
                
            }
            .onChange(of: settingsModel.DistributionList) { oldValue, newValue in
                settingsModel.saveDistributionList()
            }
        }
        
    }

}


#Preview {
    let settingsModel = SettingsModel()
    return DistributionListView()
        .environment(settingsModel)
}
