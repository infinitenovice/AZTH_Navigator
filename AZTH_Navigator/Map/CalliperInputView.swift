//
//  CalliperInputView.swift
//  AZTH_Navigator
//
//  Created by Infinite Novice on 6/30/24.
//

import SwiftUI
import MapKit

struct CalliperInputView: View {
    @Environment(ModelData.self) var modelData
    @Binding var camera: MapCameraPosition
    @FocusState private var isFocused: Bool
    @State private var input = ""
    @State private var iconColor = Color.gray
    @State private var clearCount: Int = 0
    
    
    var body: some View {
        HStack {
            Spacer()
            VStack {
                Spacer()
                Image(systemName: "compass.drawing")
                    .padding()
                    .font(.title)
                    .foregroundColor(iconColor)
                    .focusable()
                    .focused($isFocused)
                    .onKeyPress { press in
                        iconColor = Color.blue
                        input += press.characters
                        if input[input.index(before: input.endIndex)] == "\r" {
                            input = input.trimmingCharacters(in: .whitespacesAndNewlines)
                            if let radius = Double(input) {
                                if radius < 0.002 {
                                    clearCount += 1
                                    if clearCount == 3 {
                                        modelData.clearCalliperMarkers()
                                    }
                                } else {
                                    clearCount = 0
                                    var marker: CalliperMarker = CalliperMarker(id: 0, center: grid.center, radius: 0.0)
                                    let region = camera.region ?? grid.region()
                                    marker.radius = radius * mapInchesToMeters
                                    marker.center = region.center
                                    modelData.newCalliperMarker(marker: marker)
                                }
                            }
                            input = ""
                            iconColor = Color.gray
                        }
                        return .handled
                    }
                    .onAppear {
                        isFocused = true
                }
            }

        }
    }
}

