//
//  SiteButtons.swift
//  AZTH_Navigator
//
//  Created by Infinite Novice on 6/29/24.
//

import SwiftUI
import MapKit

struct SiteButtons: View {
    @Bindable var siteMarker: SiteMarker
    @Binding var camera: MapCameraPosition

    var body: some View {
        var region: MKCoordinateRegion = camera.region ?? grid.region()

        HStack {
            Spacer()
            
            Button {
                region = camera.region ?? grid.region()
                siteMarker.latitude = region.center.latitude
                siteMarker.longitude = region.center.longitude
                print("move")
            } label: {
                Image(systemName: "move.3d")
            }
            .buttonStyle(.bordered)
            Spacer()
            
            Button {
                print("send")
            } label: {
                Image(systemName: "square.and.arrow.up")
            }
            .buttonStyle(.bordered)
            Spacer()
            
            Button {
                print("navigate")
            } label: {
                Image(systemName: "car.circle")
            }
            .buttonStyle(.bordered)
            Spacer()
        }
        .font(.title)
        .foregroundColor(.white)
    }
}

