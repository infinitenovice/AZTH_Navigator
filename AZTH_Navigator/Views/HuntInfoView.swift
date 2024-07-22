//
//  HuntInfoView.swift
//  AZTH_Navigator
//
//  Created by Infinite Novice on 7/19/24.
//

import SwiftUI

struct HuntInfoView: View {
    @Environment(HuntInfoModel.self) var huntInfoModel
    
    var body: some View {
        VStack {
            Spacer()
            HStack{
                Spacer()
                Text(huntInfoModel.huntTimeLabel+huntInfoModel.huntTimeDisplay)
                if huntInfoModel.huntState == HuntInfoModel.HuntState.InProgress {
                    Spacer()
                    Text(huntInfoModel.clueTimeDisplay)
                }
                if huntInfoModel.huntState != HuntInfoModel.HuntState.NotStarted {
                    Spacer()
                    Text(huntInfoModel.huntStatsDisplay)
                }
                Spacer()
            }
            .font(.title3)
            .foregroundColor(.white)
            .background(Color.mapButton)
            .frame(width: 600)
            .cornerRadius(15)
        }
        
    }
}

#Preview {
    let huntInfoModel = HuntInfoModel()
    return HuntInfoView()
        .environment(huntInfoModel)
}
