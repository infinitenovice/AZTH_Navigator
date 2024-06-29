//
//  HuntModel.swift
//  AZTH_Navigator
//
//  Created by Infinite Novice on 6/28/24.
//

import SwiftData
import SwiftUI

struct HuntData {
    @Query var siteMarkers: [SiteMarker]
    @State private var selectedSite: Int? 
}
