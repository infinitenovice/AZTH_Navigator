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
                Spacer(minLength: 500)
                VStack {
                    HStack {
                        Button {
                            navigationModel.nextStep()
                        } label: {
                            Text("Step")
                                .padding(.leading)
                        }
                        Spacer()
                        Text(String(Int((navigationModel.stepRemainingDistance ?? 0)*FeetPerMeter))+" ft")
                        Spacer()
                        Button {
                            navigationModel.clearRoute()
                        }label: {
                            Image(systemName: "xmark.circle")
                        }
                        .font(.title)
                        .foregroundColor(.white)
                        .padding()
                    }
  
                    VStack {
                        Text(navigationModel.stepInstructions ?? "End of Route")
                            .lineLimit(2)
                    }
                    Spacer()
                }
                .foregroundStyle(.white)
                .frame(width: 300, height:140, alignment: .leading)
                .background(.black)
                .cornerRadius(15)
//                Spacer()
                .padding(.bottom)
                .padding(.bottom)
                .padding(.bottom)
            }
            Spacer()
        }
        .padding(.leading)
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
