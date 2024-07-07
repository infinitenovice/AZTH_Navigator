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
    @Environment(LocationManager.self) var locationManager
    @Query var siteMarkers: [SiteMarker]
    
//    @State private var routeEnd:  MKMapItem?
    @State private var route: MKRoute?
    @State private var travelTime: TimeInterval?


    
    var body: some View {
        @Bindable var modelData = modelData
        ZStack {
            MapReader { proxy in
                //                Map(position: $camera, selection: $markerSelection) {
                Map(position: $modelData.camera, selection: $modelData.markerSelection) {
                    UserAnnotation()
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
                    if let route, modelData.navigationActive {
                        MapPolyline(route.polyline)
                            .stroke(.blue,lineWidth: 6)
                    }
                }
                .mapStyle(.hybrid)
                .onMapCameraChange { cameraContext in
                    modelData.camera = .region(cameraContext.region)
                }
                .task(id: modelData.targetDestination) {
                    if modelData.targetDestination != nil {
                        route = nil
                        await fetchRoute()
                    }
                }
            }
            CrossHairView()
            ControlsView()
            MapButtonsView()
            if modelData.navigationActive {
                NavigationView()
            }
            if modelData.markerSelection != nil {
                SiteDetailView(siteMarker: siteMarkers[modelData.markerSelection!])
             
            }
        }
    }
    
    func fetchRoute() async {
        if let userLocation = locationManager.userLocation, let targetDestination = modelData.targetDestination {
            let request = MKDirections.Request()
            let startPlacemark = MKPlacemark(coordinate: userLocation.coordinate)
            let endPlacemark = MKPlacemark(coordinate: targetDestination.coordinate)
            let routeStart = MKMapItem(placemark: startPlacemark)
            let routeEnd = MKMapItem(placemark: endPlacemark)
            request.source = routeStart
            request.destination = routeEnd
            request.transportType = .automobile
            let directions = MKDirections(request: request)
            let result = try? await directions.calculate()
            route = result?.routes.first
            travelTime = route?.expectedTravelTime
        }
    }
}


#Preview {
    @State var camera: MapCameraPosition = .region(GridRegion())
    let config = ModelConfiguration(isStoredInMemoryOnly: true)
    let container = try! ModelContainer(for: SiteMarker.self, configurations: config)
    return MapView()
        .environment(ModelData())
        .environment(LocationManager())
        .modelContainer(container)
}
