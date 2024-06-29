//
//  GridHelpers.swift
//  AZTH_Navigator
//
//  Created by Infinite Novice on 6/22/24.
//

import SwiftUI
import MapKit

struct CellCoordinates {
    var row: Int
    var col: Int
}
enum LabelPosition {case top, bottom, left, right}


func gridLines() -> [CLLocationCoordinate2D] {
    var gridPolyLine: [CLLocationCoordinate2D] = []
    var p1,p2: CLLocationCoordinate2D
    var toggle: Bool = true
    
    for column in 0...grid.columnCount() {
        p1 = CLLocationCoordinate2D(latitude: grid.boundaryNorth(), longitude: grid.boundaryWest() + grid.cellWidth() * Double(column))
        p2 = CLLocationCoordinate2D(latitude: grid.boundarySouth(), longitude: grid.boundaryWest() + grid.cellWidth() * Double(column))
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
    for row in 0...grid.rowCount() {
        p1 = CLLocationCoordinate2D(latitude: grid.boundarySouth() + grid.cellHeight() * Double(row), longitude: grid.boundaryEast())
        p2 = CLLocationCoordinate2D(latitude: grid.boundarySouth() + grid.cellHeight() * Double(row), longitude: grid.boundaryWest())
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


func labelCoords(bar: LabelPosition, i: Int) -> CLLocationCoordinate2D{
    switch bar {
    case .top:
        return CLLocationCoordinate2D(
                latitude: grid.boundaryNorth() + grid.cellHeight() / 2,
                longitude: grid.boundaryWest() + grid.cellWidth() * Double(i) + grid.cellWidth() / 2)
    case .bottom:
        return CLLocationCoordinate2D(
                latitude: grid.boundarySouth() - grid.cellHeight() / 2,
                longitude: grid.boundaryWest() + grid.cellWidth() * Double(i) + grid.cellWidth() / 2)
    case .left:
        return CLLocationCoordinate2D(
                latitude: grid.boundaryNorth() - grid.cellHeight() * Double(i) - grid.cellHeight() / 2,
                longitude: grid.boundaryWest() - grid.cellWidth() / 2)
    case .right:
        return CLLocationCoordinate2D(
                latitude: grid.boundaryNorth() - grid.cellHeight() * Double(i) - grid.cellHeight() / 2,
                longitude: grid.boundaryEast() + grid.cellWidth() / 2)
    }
}

func onGrid(coordinate: CLLocationCoordinate2D) -> Bool {
    return  coordinate.latitude >= grid.boundarySouth()
            && coordinate.latitude <= grid.boundaryNorth()
            && coordinate.longitude >= grid.boundaryWest()
            && coordinate.longitude <= grid.boundaryEast()
}



func cellCenter(coordinate: CLLocationCoordinate2D) -> CLLocationCoordinate2D {
    var center: CLLocationCoordinate2D
    if onGrid(coordinate: coordinate) {
        center = coordinate
    } else {
        center = coordinate
    }
    return center
}

