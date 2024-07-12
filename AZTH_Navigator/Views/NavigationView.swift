//
//  NavigationView.swift
//  AZTH_Navigator
//
//  Created by Infinite Novice on 7/6/24.
//

import SwiftUI
import MapKit

struct NavigationView: View {
    @Environment(MapModel.self) var mapModel
    @Environment(NavigationModel.self) var navigationModel
    @Environment(LocationManager.self) var locationManager

    var body: some View {
        HStack {
            VStack {
                Spacer()
                VStack {
                    HStack {
                        Button {
                            navigationModel.nextStep()
                        } label: {
                            Text("Step")
                                .padding()
                        }
                        Spacer()
                        Text(String(Int((navigationModel.stepRemainingDistance ?? 0)*FeetPerMeter)))
                        Spacer()
                        Button {
                            navigationModel.clearRoute()
                        }label: {
                            Image(systemName: "xmark.circle")
                        }
                        .buttonStyle(.bordered)
                        .foregroundColor(.black)
                        .tint(.gray)
                    }
                    Divider()
                    VStack {
//                        Text(navigationModel.stepDistance())
                        Text(navigationModel.stepInstructions ?? "End of Route")
                            .lineLimit(2)
                    }
                    Spacer()
                }
                .foregroundStyle(.black)
                .frame(width: 350, height:160, alignment: .leading)
                .background(.gray)
                .cornerRadius(15)
                .padding()
                .font(.title2)
            }
            Spacer()
        }
        .onChange(of: locationManager.userLocation) { oldValue, newValue in
            navigationModel.updateStepRemainingDistance(locationManager: locationManager)
        }
    }
}

#Preview {
    let mapModel = MapModel()
    let navigation = NavigationModel()
    let locationManager = LocationManager()
    return NavigationView()
        .environment(mapModel)
        .environment(navigation)
        .environment(locationManager)
}
