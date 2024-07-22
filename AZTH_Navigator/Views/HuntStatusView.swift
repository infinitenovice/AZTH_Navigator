//
//  HuntStatusView.swift
//  AZTH_Navigator
//
//  Created by Infinite Novice on 7/19/24.
//

import SwiftUI

struct HuntStatusView: View {
    @Environment(HuntModel.self) var huntModel
    
    var body: some View {
        VStack {
            Spacer()
            HStack{
                Spacer()
                Text(huntModel.huntTimeLabel+huntModel.huntTimeDisplay)
                if huntModel.huntState == HuntModel.HuntState.InProgress {
                    Spacer()
                    Text(huntModel.clueTimeDisplay)
                }
                if huntModel.huntState != HuntModel.HuntState.NotStarted {
                    Spacer()
                    Text(huntModel.huntStatsDisplay)
                }
                Spacer()
            }
            .font(.title2)
            .foregroundColor(.white)
            .background(Color.black)
            .frame(width: 600)
            .cornerRadius(15)
        }
        
    }
}

#Preview {
    let huntModel = HuntModel()
    return HuntStatusView()
        .environment(huntModel)
}
