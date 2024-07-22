//
//  AppIconView.swift
//  AZTH_Navigator
//
//  Created by Infinite Novice on 7/17/24.
//

import SwiftUI

struct AppIconView: View {
    var size: CGFloat
    
    var body: some View {
        ZStack{

            Image("KickAss1")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 200, height: 200)
                .background(.blue)

        }
    }
}

#Preview {
    AppIconView(size: 1024)
}
