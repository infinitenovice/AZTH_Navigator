//
//  DragPin.swift
//  AZTH_Navigator
//
//  Created by Infinite Novice on 6/23/24.
//

import SwiftUI
import MapKit

// Custom Draggable Pin Annotation
struct DraggablePin: View {
    var tint: Color = .red
    var proxy: MapProxy
    @Binding var coordinate: CLLocationCoordinate2D
    var onCoordinateChange: (CLLocationCoordinate2D) -> ()
    // View properties
    @State private var isActive: Bool = false
    @State private var translation: CGSize = .zero
    var body: some View {
        GeometryReader {
            let frame = $0.frame(in: .global)
            Image(systemName: "mappin")
                .font(.largeTitle)
                .foregroundStyle(tint.gradient)
                .animation(.snappy) { content in
                    content
                        .scaleEffect(isActive ? 1.3 : 1, anchor: .bottom)
                }
                .frame(width: frame.width, height: frame.height)
                .onChange(of: isActive, initial: false) { oldvalue, newvalue in
                    let position = CGPoint(x: frame.midX, y: frame.midY)
                    // convert position into location coordinates using map proxy
                    if let coordinate = proxy.convert(position, from: .global), !newvalue {
                        // update coordinate based on translation and set translation to zero
                        self.coordinate = coordinate
                        translation = .zero
                        onCoordinateChange(coordinate)
                    }
                }
        }
        .frame(width: 30, height: 30)
        .contentShape(.rect)
        .offset(translation)
        .gesture(
            LongPressGesture(minimumDuration: 0.15)
                .onEnded {
                    isActive = $0
                }
                .simultaneously(with:
                    DragGesture(minimumDistance: 0)
                        .onChanged { value in
                            if isActive { translation = value.translation}
                        }
                        .onEnded { value in
                            if isActive { isActive = false}
                        }
                )
        )
    }
}
