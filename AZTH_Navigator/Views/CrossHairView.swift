//
//  CrossHairView.swift
//  AZTH_Navigator
//
//  Created by Infinite Novice on 6/25/24.
//

import SwiftUI

struct CrossHairView: View {
    var body: some View {
        let targetDiameter = 3.0
        let dashLength = 8.0
        let strokeWidth = 3.0
        let rotation = 0.0
        ZStack {
            HStack {
                Rectangle()
                    .frame(width: dashLength, height: strokeWidth)
                Circle()
//                    .stroke()
                    .frame(width: targetDiameter)
                Rectangle()
                    .frame(width: dashLength, height: strokeWidth)

            }
            VStack {
                Rectangle()
                    .frame(width: strokeWidth, height: dashLength)
                Circle()
                    .stroke()
                    .frame(width: targetDiameter)
                Rectangle()
                    .frame(width: strokeWidth, height: dashLength)

            }
        }
        .foregroundColor(.red)
        .rotationEffect(.degrees(rotation))
    }
}

#Preview {
    CrossHairView()
}
