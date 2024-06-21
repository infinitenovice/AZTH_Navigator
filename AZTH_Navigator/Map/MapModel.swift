//
//  MapModel.swift
//  AZTH_Navigator
//
//  Created by Infinite Novice on 6/20/24.
//

import MapKit
/// Key Locations
let WestWorld = CLLocationCoordinate2D(latitude: 33.63203, longitude: -111.88011)

/// Map Grid
let GridCenter: CLLocationCoordinate2D = CLLocationCoordinate2D(
    latitude: 33.75500,
    longitude: -111.96700)
let GridSpanLat: CLLocationDegrees = 0.23100
let GridSpanLon: CLLocationDegrees = 0.34390

let NorthGridBoundary:  CLLocationDegrees = GridCenter.latitude + GridSpanLat / 2
let SouthGridBoundary:  CLLocationDegrees = GridCenter.latitude - GridSpanLat / 2
let EastGridBoundary:   CLLocationDegrees = GridCenter.longitude + GridSpanLon / 2
let WestGridBoundary:   CLLocationDegrees = GridCenter.longitude - GridSpanLon / 2


let GridColumns = ["A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T"]
let GridRowCount = 16
let GridCellWidth = GridSpanLon / CLLocationDegrees(GridColumns.count)
let GridCellHieght = GridSpanLat / CLLocationDegrees(GridRowCount)




/// Extensions
extension MKCoordinateRegion {
    static let gridRegion = MKCoordinateRegion(
        center: GridCenter,
        span: MKCoordinateSpan(
            latitudeDelta: GridSpanLat,
            longitudeDelta: GridSpanLon)
    )
}
