//
//  MapHelpers.swift
//  AZTH_Navigator
//
//  Created by Infinite Novice on 6/20/24.
//

import Foundation
import MapKit

func gridLines() -> [CLLocationCoordinate2D] {
    var gridPolyLine: [CLLocationCoordinate2D] = []
    var p1,p2: CLLocationCoordinate2D
    var toggle: Bool = true
    
    for column in 0...GridColumns.count {
        p1 = CLLocationCoordinate2D(latitude: NorthGridBoundary, longitude: WestGridBoundary + GridCellWidth * Double(column))
        p2 = CLLocationCoordinate2D(latitude: SouthGridBoundary, longitude: WestGridBoundary + GridCellWidth * Double(column))
        if toggle {
            gridPolyLine.append(p1)
            gridPolyLine.append(p2)
            toggle = false
        } else {
            gridPolyLine.append(p2)
            gridPolyLine.append(p1)
            toggle = true
        }
    }
    for row in 0...GridRowCount {
        p1 = CLLocationCoordinate2D(latitude: SouthGridBoundary + GridCellHieght * Double(row), longitude: EastGridBoundary)
        p2 = CLLocationCoordinate2D(latitude: SouthGridBoundary + GridCellHieght * Double(row), longitude: WestGridBoundary)
        if toggle {
            gridPolyLine.append(p1)
            gridPolyLine.append(p2)
            toggle = false
        } else {
            gridPolyLine.append(p2)
            gridPolyLine.append(p1)
            toggle = true
    }

    }
    return gridPolyLine
}

func gridAddress(coordinate: CLLocationCoordinate2D) -> String {
    var address: String = "Off Grid"
    
    if coordinate.latitude >= SouthGridBoundary 
        && coordinate.latitude <= NorthGridBoundary
        && coordinate.longitude >= WestGridBoundary 
        && coordinate.longitude <= EastGridBoundary {
            address = GridColumns[Int((coordinate.longitude-WestGridBoundary)/GridCellWidth)]
            address += String((GridRowCount-Int((coordinate.latitude-SouthGridBoundary)/GridCellHieght)))
    }
    return address
}
