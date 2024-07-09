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
    @Environment(MapModel.self) var mapModel
    @Query var siteMarkers: [SiteMarker]


    var body: some View {
        
        HStack {
            Spacer()
            VStack {
                Button {
                    mapModel.gridZoom()
                } label: {
                    Image(systemName: "map")
                }
                .padding(.horizontal)
                
                Button {
                    mapModel.sparkleZoom()
                } label: {
                    Image(systemName: "sparkle.magnifyingglass")
                }
                .padding(.horizontal)
                                               
                
                Button {
                    let region = mapModel.region()
                    let newMarker = SiteMarker(id: siteMarkers.count, latitude: region.center.latitude, longitude: region.center.longitude)
                    modelContext.insert(newMarker)
                } label: {
                    Image(systemName: "mappin.circle")
                }
                .padding(.horizontal)
                
                Spacer()
            }
            .buttonStyle(.bordered)
            .foregroundColor(.white)
            .font(.title)
            .tint(.gray)
        }
    }
}

#Preview {
    let mapModel = MapModel()
    let locationManager = LocationManager()
    let config = ModelConfiguration(isStoredInMemoryOnly: true)
    let container = try! ModelContainer(for: SiteMarker.self, configurations: config)
    return MapButtonsView()
        .environment(mapModel)
        .environment(locationManager)
        .modelContainer(container)
}
