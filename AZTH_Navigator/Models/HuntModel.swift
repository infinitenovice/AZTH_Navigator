//
//  HuntModel.swift
//  AZTH_Navigator
//
//  Created by Infinite Novice on 7/21/24.
//

import SwiftUI

@Observable
class HuntModel {
    var huntInfo = HuntInfo()
    
    var huntState: HuntState        = HuntState.NotStarted
    var huntTimeLabel: String       = "The Hunt begins in "
    var huntTimeDisplay: String     = ""
    var clueTimeLabel: String       = ""
    var clueTimeDisplay: String     = ""
    var huntStatsLabel: String      = ""
    var huntStatsDisplay: String    = ""
    var phoneList: [String]         = []

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
                updatePhoneList()
            } catch {
                print(error)
            }
        }
    }
    func save() {
        do {
            let data = try JSONEncoder().encode(huntInfo)
            try data.write(to: huntInfoURL)
            updatePhoneList()
        } catch {
            print(error)
        }
    }
    
    func updatePhoneList() {
        for member in 0..<huntInfo.teamMembers.count {
            if (huntInfo.teamMembers[member].phoneNumber != "") && (huntInfo.teamMembers[member].iPhone)  {
                phoneList.append(huntInfo.teamMembers[member].phoneNumber)
            }
        }
    }
}

struct HuntInfo: Codable {
    var huntTitle: String = ""
    var huntTheme: String = ""
    var huntStartDate: Date = Date.now
    var teamName: String = ""
    var carNumber: String = ""
    var teamMembers: [TeamMember] = [TeamMember(),TeamMember(),TeamMember(),TeamMember(),TeamMember(),TeamMember()]
}

struct TeamMember: Identifiable, Codable, Hashable {
    var id = UUID().uuidString
    var name: String = ""
    var phoneNumber: String = ""
    var iPhone: Bool = false
}
