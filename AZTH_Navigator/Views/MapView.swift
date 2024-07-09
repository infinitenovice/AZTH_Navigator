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
    
    @Environment(MapModel.self) var mapModel
    @Environment(CalliperModel.self) var calliperModel
    @Environment(NavigationModel.self) var navigationModel
    @Environment(LocationManager.self) var locationManager
    @Query var siteMarkers: [SiteMarker]
    @State var grid = GridModel()
    
    var body: some View {
        @Bindable var mapModel = mapModel

        ZStack {
            MapReader { proxy in
                Map(position: $mapModel.camera, selection: $mapModel.markerSelection) {
                    UserAnnotation()
                    ForEach(grid.lines) {gridline in
                        MapPolyline(coordinates: gridline.points).stroke(.white, lineWidth: 1)
                    }
                    ForEach(grid.labels) {gridlabel in
                        Annotation("",coordinate: gridlabel.point) {Text(gridlabel.label).foregroundStyle(.white).font(.title2)}
                    }
                    ForEach(siteMarkers) { siteMarker in
                        Marker(siteMarker.label, monogram: Text(ClueLetters[siteMarker.clueLetterIndex]), coordinate: siteMarker.coordinate)
                            .tag(siteMarker.id)
                            .tint(siteStatus[siteMarker.statusIndex].color)
                    }
                    ForEach(calliperModel.markers) { calliperMarker in
                        MapCircle(center: calliperMarker.center, radius: calliperMarker.radius)
                            .foregroundStyle(.clear)
                            .stroke(.blue, lineWidth: 2)
                        Annotation("",coordinate: calliperMarker.center) {Text("+")
                            .foregroundColor(Color.blue)}
                        let pointOnCircle: CLLocationCoordinate2D = CLLocationCoordinate2D(latitude: calliperMarker.center.latitude, longitude: calliperMarker.center.longitude+calliperMarker.radius*DegreesPerMeterLon)
                        MapPolyline(coordinates: [calliperMarker.center,pointOnCircle]).stroke(.blue, lineWidth: 2)
                        Annotation("",coordinate: pointOnCircle) {
                            Text(String(Int(calliperMarker.radius*3.28084))+" ft")
                                .foregroundColor(Color.white)
                                .font(.footnote)
                        }
                    }
                    if let routePolyline = navigationModel.routePolyline {
                        MapPolyline(routePolyline)
                            .stroke(.blue,lineWidth: 6)
                    }
                }
                .mapStyle(.hybrid)
                .onMapCameraChange { cameraContext in
                    mapModel.camera = .region(cameraContext.region)
                }
                .task(id: navigationModel.targetDestination) {
                    if navigationModel.targetDestination != nil {
                        navigationModel.route = nil
                        await navigationModel.fetchRoute(locationManager: locationManager)
                    }
                }
                .task(id: locationManager.userLocation) {
                    if navigationModel.route != nil {
//                        await NavigationManager.fetchRoute(mapModel: mapModel, locationManager: locationManager)
                    }
                }
            }
            CrossHairView()
            ControlsView()
            MapButtonsView()
            if navigationModel.route != nil {
                NavigationView()
            }
            if mapModel.markerSelection != nil {
                SiteDetailView(siteMarker: siteMarkers[mapModel.markerSelection!])
             
            }
        }
    }
}


#Preview {
    let calliperModel = CalliperModel()
    let mapModel = MapModel()
    let navigationModel = NavigationModel()
    let locationManager = LocationManager()
    let config = ModelConfiguration(isStoredInMemoryOnly: true)
    let container = try! ModelContainer(for: SiteMarker.self, configurations: config)
    return MapView()
        .environment(calliperModel)
        .environment(mapModel)
        .environment(navigationModel)
        .environment(locationManager)
        .modelContainer(container)
}
