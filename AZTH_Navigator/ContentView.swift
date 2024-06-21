//
//  ContentView.swift
//  AZTH_Navigator
//
//  Created by Infinite Novice on 6/18/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            MapView()
            Text("Grid ID")
                .font(.title)
            Spacer()
        }
    }
}

#Preview {
    ContentView()
}
