//
//  HuntInfoModel.swift
//  AZTH_Navigator
//
//  Created by Infinite Novice on 7/21/24.
//

import SwiftUI

@Observable
class HuntInfoModel {
    var huntInfo = HuntInfo()
    
    var huntState: HuntState        = HuntState.NotStarted
    var huntTimeLabel: String       = "The Hunt begins in "
    var huntTimeDisplay: String     = ""
    var clueTimeLabel: String       = ""
    var clueTimeDisplay: String     = ""
    var huntStatsLabel: String      = ""
    var huntStatsDisplay: String    = ""
    
    let huntInfoURL = URL.documentsDirectory.appending(path: "HuntInfo.json")

    init() {
        self.load()
    }
    
    enum HuntState {
        case NotStarted
        case InProgress
        case Ended
    }
    
    func updateTimers() {
        if huntTimeDisplay == "" {
            
        }
    }
    
    func load() {
        if FileManager().fileExists(atPath: huntInfoURL.path) {
            do {
                let jsonData = try Data(contentsOf: huntInfoURL)
                let data = try JSONDecoder().decode(HuntInfo.self, from: jsonData)
                huntInfo = data
            } catch {
                print(error)
            }
        }
    }
    func save() {
        do {
            let data = try JSONEncoder().encode(huntInfo)
            try data.write(to: huntInfoURL)
        } catch {
            print(error)
        }
    }
}

struct HuntInfo: Codable {
    var huntTitle: String = ""
    var huntStartDate: Date = Date.now
}
