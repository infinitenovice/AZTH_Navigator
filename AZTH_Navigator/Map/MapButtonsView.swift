//
//  MapButtonsView.swift
//  AZTH_Navigator
//
//  Created by Infinite Novice on 6/23/24.
//

import SwiftUI
import MapKit
import SwiftData

struct MapButtonsView: View {
    @Environment(\.modelContext) private var modelContext
    @Binding var camera: MapCameraPosition
    var markerCount: Int


    var body: some View {

        var region: MKCoordinateRegion = camera.region ?? grid.region()
        
        HStack {
            Spacer()
            VStack {
                Button {
                    camera = .region(grid.region())
                } label: {
                    Image(systemName: "map")
                }
                .buttonStyle(.bordered)
                .padding(.horizontal)
                
                Button {
                    region = camera.region ?? grid.region()
                    region = grid.cellRegion(coordinate: region.center)
                    camera = .region(region)
                } label: {
                    Image(systemName: "sparkle.magnifyingglass")
                }
                .buttonStyle(.bordered)
                .padding(.horizontal)
                                               
                
                Button {
                    region = camera.region ?? grid.region()
                    let newMarker = SiteMarker(id: markerCount, latitude: region.center.latitude, longitude: region.center.longitude)
                    modelContext.insert(newMarker)
                } label: {
                    Image(systemName: "mappin.circle")
                }
                .buttonStyle(.bordered)
                .padding(.horizontal)
                
                Spacer()
            }
            .foregroundColor(.white)
            .font(.title)


        }

    }
}

#Preview {
    let config = ModelConfiguration(isStoredInMemoryOnly: true)
    let container = try! ModelContainer(for: SiteMarker.self, configurations: config)
    return MapButtonsView(camera: .constant(.region(grid.region())),markerCount: 0)
        .modelContainer(container)
}
