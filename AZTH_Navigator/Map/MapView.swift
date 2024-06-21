//
//  MapView.swift
//  AZTH_Navigator
//
//  Created by Infinite Novice on 6/20/24.
//

import SwiftUI
import MapKit

struct MapView: View {
    @State private var camera: MapCameraPosition = .region(.gridRegion)
    @State private var showGrid: Bool = true
    
    var body: some View {
        MapReader { proxy in
            Map(position: $camera) {
                Marker("West World", monogram: Text("WW"), coordinate: WestWorld)
                    .tint(.green)
                if showGrid {
                    MapPolyline(coordinates: gridLines())
                        .stroke(.gray, lineWidth: 3)
                }
            }
            .mapStyle(.hybrid)
            .onTapGesture { position in
                if let coordinate = proxy.convert(position, from: .local) {
                    print(gridAddress(coordinate: coordinate))
                }
            }
        }
    }
}

#Preview {
    MapView()
}
