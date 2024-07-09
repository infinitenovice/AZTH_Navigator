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

    var body: some View {
        HStack {
            VStack {
                Spacer()
                VStack {
                    HStack {
                        Text("Time to Site:")
                            .padding(.leading)
                        Text(navigationModel.routeTime())
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
                        Text(navigationModel.stepInstruction())
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
    }
}

#Preview {
    let mapModel = MapModel()
    let navigation = NavigationModel()
    return NavigationView()
        .environment(mapModel)
        .environment(navigation)
}
