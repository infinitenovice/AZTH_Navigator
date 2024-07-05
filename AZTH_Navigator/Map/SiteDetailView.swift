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
    @Binding var camera: MapCameraPosition
    @State private var isShowingMessages = false


    
    var body: some View {
        HStack {
            VStack {
                Group {
                    HStack {
                        Spacer()
                        
                        Button {
                            let region = camera.region ?? GridRegion()
                            siteMarker.latitude = region.center.latitude
                            siteMarker.longitude = region.center.longitude
                            print("move")
                        } label: {
                            Image(systemName: "move.3d")
                        }
                        .buttonStyle(.bordered)
                        Spacer()
                        
                        Button {
                            isShowingMessages = true
                        } label: {
                            Image(systemName: "square.and.arrow.up")
                        }
                        .buttonStyle(.bordered)
                        .sheet(isPresented: self.$isShowingMessages) {
                            MessageView(recipients: ["+14804400932"],
                                        message: "http://maps.apple.com/?ll="+String(siteMarker.latitude)+","+String(siteMarker.longitude))
                                .ignoresSafeArea()
                        }
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
                        .frame(width: 300,height: 50)
//                        .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/)
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
//                    .border(Color.black)
                    .listStyle(.plain)
                }
                Spacer()
            }
            .background(.clear)
            Spacer()
        }
    }
}

