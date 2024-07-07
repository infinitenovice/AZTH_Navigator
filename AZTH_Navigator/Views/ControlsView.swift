//ControlsView.swift
//  AZTH_Navigator
//
//  Created by Infinite Novice on 6/30/24.
//

import SwiftUI
import MapKit

struct ControlsView: View {
    @Environment(ModelData.self) var modelData
    @State private var input = ""
    @State private var iconColor = Color.black
    @State private var clearCount: Int = 0
    @State private var settingsSheetShowing: Bool = false
    
   
    var body: some View {
        HStack {
            Spacer()
            VStack {
                Spacer()
                HStack {
                    Button {
                        settingsSheetShowing = true
                    } label: {
                        Image(systemName: "gear")
                            .font(.title)
                            .foregroundColor(.black)
                    }
                    .sheet(isPresented: $settingsSheetShowing) {
                        SettingsView()
                    }
                    if modelData.enableCallipers {
                        Image(systemName: "compass.drawing")
                            .font(.title)
                            .foregroundColor(iconColor)
                        TextField("", text: $input)
                            .tint(.black)
                            .font(.title3)
                            .frame(width:40)
                            .border(Color.black)
                            .padding([.trailing])
                            .foregroundColor(.gray)
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
                                            var marker: CalliperMarker = CalliperMarker(id: 0, center: GridCenter, radius: 0.0)
                                            let region = modelData.camera.region ?? GridRegion()
                                            marker.radius = radius * MapInch
                                            marker.center = region.center
                                            modelData.newCalliperMarker(marker: marker)
                                        }
                                    }
                                    input = ""
                                    iconColor = Color.black
                                }
                                return .handled
                            }
                    }
                }
            }
        }
    }
}

#Preview {
    let modelData = ModelData()
    return ControlsView()
        .environment(modelData)
}
