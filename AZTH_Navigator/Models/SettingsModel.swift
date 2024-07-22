//
//  SettingsModel.swift
//  AZTH_Navigator
//
//  Created by Infinite Novice on 7/16/24.
//

import SwiftUI

@Observable
class SettingsModel {
    var settings: Settings = Settings(huntTitle: "", distributionList: [])
    var DistributionList: [Recipient] = []
    let distributionListURL = URL.documentsDirectory.appending(path: "DistributionList.json")
    let settingsURL = URL.documentsDirectory.appending(path: "HuntSettings.json")

    init() {
        self.loadDistributionList()
        self.loadSettings()
    }
    
    func saveDistributionList() {
        do {
            let settingsData = try JSONEncoder().encode(DistributionList)
            try settingsData.write(to: distributionListURL)
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func loadDistributionList() {
        if FileManager().fileExists(atPath: distributionListURL.path) {
            do {
                let jsonData = try Data(contentsOf: distributionListURL)
                DistributionList = try JSONDecoder().decode([Recipient].self, from: jsonData)
            } catch {
                print(error)
            }
        }
    }
    
    func loadSettings() {
        if FileManager().fileExists(atPath: settingsURL.path) {
            do {
                let jsonData = try Data(contentsOf: settingsURL)
                let settingsData = try JSONDecoder().decode([Settings].self, from: jsonData)
                settings = settingsData[0]
            } catch {
                print(error)
            }
        }
    }
    func saveSettings() {
        do {
            let settingsData = try JSONEncoder().encode(settings)
            try settingsData.write(to: settingsURL)
        } catch {
            print(error)
        }
    }
}

struct Settings: Codable {
    var huntTitle: String = ""
    var distributionList: [Recipient] = []
}

struct Recipient: Identifiable, Hashable, Codable {
    var id = UUID().uuidString
    var phoneNumber: String = ""
}
