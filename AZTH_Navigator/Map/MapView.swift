//
//  MapView.swift
//  AZTH_Navigator
//
//  Created by Infinite Novice on 6/20/24.
//

import SwiftUI
import MapKit
import SwiftData

struct MapView: View {
    @State private var camera: MapCameraPosition = .region(grid.region())
    @State private var pinCoordinate: CLLocationCoordinate2D = grid.center
    @State private var mapSelection: Int?    
    @Query var siteMarkers: [SiteMarker]

    var body: some View {
        ZStack {
            MapReader { proxy in
                Map(position: $camera, selection: $mapSelection) {
                    grid.overlay()
                    ForEach(siteMarkers) { siteMarker in
                        Marker(siteMarker.label, monogram: Text(ClueLetters[siteMarker.clueLetterIndex]), coordinate: siteMarker.coordinate)
                            .tag(siteMarker.id)
                    }
                }
                .mapStyle(.hybrid)
                .onMapCameraChange { cameraContext in camera = .region(cameraContext.region)}
            }
            MapButtonsView(camera: $camera, markerCount: siteMarkers.count)
            CrossHairView()
            if mapSelection != nil {
                SiteDetailView(siteMarker: siteMarkers[mapSelection!], camera: $camera)
            }
        }
    }
    
}


#Preview {
    let config = ModelConfiguration(isStoredInMemoryOnly: true)
    let container = try! ModelContainer(for: SiteMarker.self, configurations: config)
    return MapView()
        .modelContainer(container)
}
