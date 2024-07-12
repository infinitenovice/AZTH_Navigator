//
//  LocationDeniedView.swift
//  AZTH_Navigator
//
//  Created by Infinite Novice on 7/6/24.
//

import SwiftUI

struct LocationDeniedView: View {
    var body: some View {
        ContentUnavailableView(
            label: {Label("Hey, Jackass!", image: "Jackass1")},
            description: {Text("You have to enable location services")},
            actions: {
                Button {
                    UIApplication.shared.open(
                        URL(string: UIApplication.openSettingsURLString)!,
                        options: [:],
                        completionHandler: nil)
                } label: {
                    Text("Open Settings")
                }
        })
    }
}

#Preview {
    LocationDeniedView()
}
