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
    @Environment(ModelData.self) var modelData
    @Query var siteMarkers: [SiteMarker]


    var body: some View {

        var region: MKCoordinateRegion = modelData.camera.region ?? GridRegion()
        
        HStack {
            Spacer()
            VStack {
                Button {
                    modelData.camera = .region(GridRegion())
                } label: {
                    Image(systemName: "map")
                }
                .padding(.horizontal)
                
                Button {
                    region = modelData.camera.region ?? GridRegion()
                    region = GridCellRegion(coordinate: region.center)
                    modelData.camera = .region(region)
                } label: {
                    Image(systemName: "sparkle.magnifyingglass")
                }
                .padding(.horizontal)
                                               
                
                Button {
                    region = modelData.camera.region ?? GridRegion()
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
    let modelData = ModelData()
    let config = ModelConfiguration(isStoredInMemoryOnly: true)
    let container = try! ModelContainer(for: SiteMarker.self, configurations: config)
    return MapButtonsView()
        .environment(modelData)
        .modelContainer(container)
}
