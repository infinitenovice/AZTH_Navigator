//
//  MapView.swift
//  AZTH_Navigator
//
//  Created by Infinite Novice on 6/20/24.
//

import SwiftUI
import SwiftData
import MapKit

struct MapView: View {
    @Environment(ModelData.self) var modelData
    @State private var camera: MapCameraPosition = .region(GridRegion())
    @State private var markerSelection: Int? 
    @Query var siteMarkers: [SiteMarker]

    
    var body: some View {
        ZStack {
            MapReader { proxy in
                Map(position: $camera, selection: $markerSelection) {
                    ForEach(modelData.gridLines) {gridline in
                        MapPolyline(coordinates: gridline.points).stroke(.white, lineWidth: 1)
                    }
                    ForEach(modelData.gridLabels) {gridlabel in
                        Annotation("",coordinate: gridlabel.point) {Text(gridlabel.label).foregroundStyle(.white).font(.title2)}
                    }
                    ForEach(siteMarkers) { siteMarker in
                        Marker(siteMarker.label, monogram: Text(ClueLetters[siteMarker.clueLetterIndex]), coordinate: siteMarker.coordinate)
                            .tag(siteMarker.id)
                            .tint(siteStatus[siteMarker.statusIndex].color)
                    }
                    ForEach(modelData.calliperMarkers) { calliperMarker in
                        MapCircle(center: calliperMarker.center, radius: calliperMarker.radius)
                            .foregroundStyle(.blue.opacity(0.05))
                            .stroke(.blue, lineWidth: 1.0)
                        Annotation("",coordinate: calliperMarker.center) {Text("+")
                            .foregroundColor(Color.blue)}
                    }
                }
                .onAppear() {
                    modelData.createGrid()
                }
                .mapStyle(.hybrid)
                .onMapCameraChange { cameraContext in
                    camera = .region(cameraContext.region)
                }
            }
            CrossHairView()
            MapButtonsView(camera: $camera, markerCount: siteMarkers.count)
            CalliperInputView(camera: $camera)
            if markerSelection != nil {
                SiteDetailView(siteMarker: siteMarkers[markerSelection!], camera: $camera)
            }
        }
    }
    
}


#Preview {
    let modelData = ModelData()
    let config = ModelConfiguration(isStoredInMemoryOnly: true)
    let container = try! ModelContainer(for: SiteMarker.self, configurations: config)
    return MapView()
        .environment(modelData)
        .modelContainer(container)
}
