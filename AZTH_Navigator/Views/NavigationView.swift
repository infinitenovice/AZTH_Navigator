//
//  NavigationView.swift
//  AZTH_Navigator
//
//  Created by Infinite Novice on 7/6/24.
//

import SwiftUI

struct NavigationView: View {
    @Environment(ModelData.self) var modelData

    var body: some View {
        
        HStack {
            VStack {
                Spacer()
                HStack {
                    Button {
                        modelData.navigationActive = false
                        modelData.targetDestination = nil
                    }label: {
                        Image(systemName: "xmark.circle")
                    }
                    .buttonStyle(.bordered)
                    .foregroundColor(.black)
                    .font(.title)
                    .tint(.gray)
                    Text("Navigation steps here")
                        .font(.title2)
                        .foregroundStyle(.black)
                }
                .frame(width: 350, height:100, alignment: .leading)
                .background(.gray)
                .cornerRadius(15)
                .padding()
            }
            Spacer()
        }
    }
    
}

#Preview {
    NavigationView()
        .environment(ModelData())
}
