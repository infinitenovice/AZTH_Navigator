//
//  SiteDetailView.swift
//  AZTH_Navigator
//
//  Created by Infinite Novice on 6/28/24.
//

import SwiftUI
import SwiftData
import MapKit
import Messages

struct SiteDetailView: View {
    @Bindable var siteMarker: SiteMarker
    
    @Environment(MapModel.self) var mapModel
    @Environment(NavigationModel.self) var navigationModel
    @Environment(SettingsModel.self) var settingsModel
    @Query var siteMarkers: [SiteMarker]
    @State private var isShowingMessages = false

    
    var body: some View {
        
        
        HStack {
            VStack {
                Group {
                    HStack {
                        Spacer()
                        
                        Button {
                            let region = mapModel.region()
                            siteMarker.latitude = region.center.latitude
                            siteMarker.longitude = region.center.longitude
                        } label: {
                            Image(systemName: "move.3d")
                        }

                        Spacer()
                        
                        Button {
                            isShowingMessages = true
                        } label: {
                            Image(systemName: "square.and.arrow.up")
                        }
                        .sheet(isPresented: self.$isShowingMessages) {
                            MessageSender(recipients: settingsModel.DistributionList,
                                          message: "http://maps.apple.com/?ll="+String(siteMarker.latitude)+","+String(siteMarker.longitude))
                            .ignoresSafeArea()
                        }
                        Spacer()
                        
                        Button {
                            navigationModel.targetDestination = MKPlacemark(coordinate:  CLLocationCoordinate2D(latitude: siteMarker.latitude, longitude: siteMarker.longitude))
                        } label: {
                            Image(systemName: "car.circle")
                        }

                        Spacer()
                    }
                    .buttonStyle(.borderedProminent)
                    .tint(.mapButton)
                    .font(.title)
                    .foregroundColor(.white)
                    .frame(width: 300,height: 50)
                    List {
                        Picker("Clue Letter", selection: $siteMarker.clueLetterIndex) {
                            ForEach((0..<ClueLetters.count), id: \.self) {
                                Text(ClueLetters[$0])
                            }
                        }
                        Picker("Status", selection: $siteMarker.statusIndex) {
                            ForEach((0..<siteStatus.count), id: \.self) {
                                Text(siteStatus[$0].status)
                            }
                        }
                    }
                    .frame(width: 300,height: 90)
                    .listStyle(.plain)
                    .cornerRadius(15)
                }
                Spacer()
            }
            Spacer()
        }

        .padding(.horizontal)
//        .onAppear() {
//            mapModel.selectedMarkerLocation = siteMarker.coordinate
//        }
        
    }
}
    


#Preview {
    let settingsModel = SettingsModel()
    let calliperModel = CalliperModel()
    let mapModel = MapModel()
    let navigationModel = NavigationModel()
    let locationManager = LocationManager()
    let config = ModelConfiguration(isStoredInMemoryOnly: true)
    let container = try! ModelContainer(for: SiteMarker.self, configurations: config)
    let siteMarker: SiteMarker = SiteMarker(id: 0, latitude: 0, longitude: 0)
    mapModel.markerSelection = 0
    return SiteDetailView(siteMarker: siteMarker)
        .environment(calliperModel)
        .environment(mapModel)
        .environment(navigationModel)
        .environment(locationManager)
        .environment(settingsModel)
        .modelContainer(container)
}
