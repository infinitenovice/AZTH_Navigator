//
//  GridModel.swift
//  AZTH_Navigator
//
//  Created by Infinite Novice on 7/2/24.
//

import SwiftUI
import MapKit

let Mile = 1609.344 //meters
let MapInch = Mile/2
let RadiusEarth = 6378137.0 //meters
let DegreesPerMeterLon = 1/((Double.pi/180)*RadiusEarth*cos(GridCenter.latitude*Double.pi/180))
let DegreesPerMeterLat = 1/((Double.pi/180)*RadiusEarth)

let GridCenter: CLLocationCoordinate2D = CLLocationCoordinate2D (latitude: 33.75500, longitude: -111.96700)
let GridCellWidth: CLLocationDegrees = Mile*DegreesPerMeterLon
let GridCellHeight: CLLocationDegrees = Mile*DegreesPerMeterLat
let GridBoundaryNorth: CLLocationDegrees = GridCenter.latitude + Double(GridRows.count)/2 * GridCellHeight
let GridBoundarySouth: CLLocationDegrees = GridCenter.latitude - Double(GridRows.count)/2 * GridCellHeight
let GridBoundaryEast: CLLocationDegrees = GridCenter.longitude + Double(GridColumns.count)/2 * GridCellWidth
let GridBoundaryWest: CLLocationDegrees = GridCenter.longitude - Double(GridColumns.count)/2 * GridCellWidth

let GridColumns = ["A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T"]
let GridRows = ["1","2","3","4","5","6","7","8","9","10","11","12","13","14","15","16"]

struct GridLine: Identifiable {
    var id: Int
    var points: [CLLocationCoordinate2D] = []
}

struct GridLabel: Identifiable {
    var id: Int
    var label: String
    var point: CLLocationCoordinate2D
}

func GridRegion() -> MKCoordinateRegion {
        return MKCoordinateRegion(
            center: GridCenter,
            span: MKCoordinateSpan(
                latitudeDelta: GridBoundaryNorth - GridBoundarySouth + 2*GridCellHeight,
                longitudeDelta: GridBoundaryEast - GridBoundaryWest + 2*GridCellWidth)
        )
}

func GridCellRegion(coordinate: CLLocationCoordinate2D) -> MKCoordinateRegion {
    var cell: CellCoordinates = CellCoordinates(row: 0, col: 0)
    var center: CLLocationCoordinate2D = CLLocationCoordinate2D(latitude: 0, longitude: 0)
    
    cell = cellCoordinates(coordinate: coordinate)
    center.latitude = GridBoundaryNorth - GridCellHeight * (Double(cell.row) + 0.5)
    center.longitude = GridBoundaryWest + GridCellWidth * (Double(cell.col) + 0.5)
    return MKCoordinateRegion(
        center: center,
        span: MKCoordinateSpan(
            latitudeDelta: GridCellHeight * 1.5,
            longitudeDelta: GridCellWidth * 1.5)
    )
}

func cellCoordinates(coordinate: CLLocationCoordinate2D) -> CellCoordinates {
    var cell: CellCoordinates = CellCoordinates(row: 0, col: 0)
    
    cell.col = Int((coordinate.longitude - GridBoundaryWest) / GridCellWidth)
    if cell.col < 0 {
        cell.col = 0
    }
    if cell.col >= GridColumns.count {
        cell.col = GridColumns.count - 1
    }
    cell.row = GridRows.count-1-Int((coordinate.latitude-GridBoundarySouth)/GridCellHeight)
    if cell.row < 0 {
        cell.row = 0
    }
    if cell.row >= GridRows.count {
        cell.row = GridRows.count - 1
    }
    return cell
}

struct CellCoordinates {
    var row: Int
    var col: Int
}

