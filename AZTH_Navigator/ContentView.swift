//
//  ContentView.swift
//  AZTH_Navigator
//
//  Created by Infinite Novice on 6/18/24.
//

import SwiftUI
import SwiftData

var grid = GridOverlay()


struct ContentView: View {
    var body: some View {
        ZStack {
            MapView()
        }
    }
}

#Preview {
    ContentView()
}
