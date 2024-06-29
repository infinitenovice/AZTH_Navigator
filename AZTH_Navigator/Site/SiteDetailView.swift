//
//  SiteDetailView.swift
//  AZTH_Navigator
//
//  Created by Infinite Novice on 6/28/24.
//

import SwiftUI
import SwiftData
import MapKit

struct SiteDetailView: View {
    @Bindable var siteMarker: SiteMarker
    @Binding var camera: MapCameraPosition

    
    var body: some View {
        HStack {
            VStack {
                Group {
                    SiteButtons(siteMarker: siteMarker, camera: $camera)
                    List {
                        Picker("Clue Letter", selection: $siteMarker.clueLetterIndex) {
                            ForEach((0..<ClueLetters.count), id: \.self) {
                                Text(ClueLetters[$0])
                            }
                        }
                        Picker("Status", selection: $siteMarker.statusIndex) {
                            ForEach((0..<SiteStatus.count), id: \.self) {
                                Text(SiteStatus[$0])
                            }
                        }
                    }
                }
                .frame(width: 300)
                .padding()
                Spacer()
            }
            .listStyle(.plain)
            .background(.clear)
            Spacer()
        }
    }
}

