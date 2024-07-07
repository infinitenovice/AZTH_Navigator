//
//  ModelData.swift
//  AZTH_Navigator
//
//  Created by Infinite Novice on 7/2/24.
//

import Foundation
import MapKit
import SwiftUI

@Observable
class ModelData {
    var camera: MapCameraPosition
    var enableCallipers: Bool
    var gridLines: [GridLine]
    var gridLabels: [GridLabel]
    var calliperMarkers: [CalliperMarker]
    var markerSelection: Int?
    var calliperMarkerID: Int
    
    var navigationActive: Bool
    var targetDestination: MKPlacemark?
 
    init() {
        self.camera = .region(GridRegion())
        self.enableCallipers = false
        self.gridLines  = []
        self.gridLabels  = []
        self.calliperMarkers  = []
        self.markerSelection = nil
        self.calliperMarkerID = 0
        self.navigationActive = false
        self.targetDestination = nil
        
        var gridLine: GridLine = GridLine(id: 0, points: [])
        var gridLabel: GridLabel = GridLabel(id: 0, label: "", point: CLLocationCoordinate2D(latitude: 0, longitude: 0))
        var p1: CLLocationCoordinate2D = CLLocationCoordinate2D(latitude: 0, longitude: 0)
        var p2: CLLocationCoordinate2D = CLLocationCoordinate2D(latitude: 0, longitude: 0)

        p1.latitude = GridBoundaryNorth
        p2.latitude = GridBoundarySouth
        for column in (0...GridColumns.count) {
            p1.longitude = GridBoundaryWest + Double(column) * GridCellWidth
            p2.longitude = GridBoundaryWest + Double(column) * GridCellWidth
            appendGridLine(id: column, p1: p1, p2: p2)
        }
        
        p1.longitude = GridBoundaryEast
        p2.longitude = GridBoundaryWest
        for row in (0...GridRows.count) {
            p1.latitude = GridBoundaryNorth - Double(row) * GridCellHeight
            p2.latitude = GridBoundaryNorth - Double(row) * GridCellHeight
            appendGridLine(id: (GridColumns.count+1)+row, p1: p1, p2: p2)
        }
        
        p1.latitude = GridBoundaryNorth + GridCellHeight/2
        p2.latitude = GridBoundarySouth - GridCellHeight/2
        for column in (0..<GridColumns.count) {
            p1.longitude = GridBoundaryWest + (Double(column) * GridCellWidth) + GridCellWidth/2
            p2.longitude = GridBoundaryWest + (Double(column) * GridCellWidth) + GridCellWidth/2
            appendGridLabel(id: column, point: p1, label: GridColumns[column])
            appendGridLabel(id: column+GridColumns.count, point: p2, label: GridColumns[column])
        }

        p1.longitude = GridBoundaryEast + GridCellWidth/2
        p2.longitude = GridBoundaryWest - GridCellWidth/2
        for row in (0..<GridRows.count) {
            p1.latitude = GridBoundaryNorth - (Double(row) * GridCellHeight) - GridCellHeight/2
            p2.latitude = GridBoundaryNorth - (Double(row) * GridCellHeight) - GridCellHeight/2
            appendGridLabel(id: row+(GridColumns.count*2), point: p1, label: GridRows[row])
            appendGridLabel(id: row+GridRows.count+(GridColumns.count*2), point: p2, label: GridRows[row])
        }

        func appendGridLine(id: Int, p1: CLLocationCoordinate2D, p2: CLLocationCoordinate2D) {
            gridLine.id = id
            gridLine.points.append(p1)
            gridLine.points.append(p2)
            gridLines.append(gridLine)
            gridLine.points.removeAll()
        }
        
        func appendGridLabel(id: Int, point: CLLocationCoordinate2D, label: String) {
            gridLabel.id = id
            gridLabel.point = point
            gridLabel.label = label
            gridLabels.append(gridLabel)
        }
    }
    
    func newCalliperMarker(marker: CalliperMarker) {
        calliperMarkers.append(marker)
        calliperMarkers[calliperMarkerID].id = calliperMarkerID
        calliperMarkerID += 1
    }
    
    func clearCalliperMarkers() {
        calliperMarkers.removeAll()
        calliperMarkerID = 0
    }
}
