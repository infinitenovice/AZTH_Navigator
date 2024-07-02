//
//  GridOverlay.swift
//  AZTH_Navigator
//
//  Created by Infinite Novice on 6/21/24.
//

import SwiftUI
import MapKit


struct GridOverlay {

    let center: CLLocationCoordinate2D = CLLocationCoordinate2D(
        latitude: 33.75500,
        longitude: -111.96700)
    let height: CLLocationDegrees = 0.23100
    let width: CLLocationDegrees = 0.34390
    
    func boundaryNorth()    -> CLLocationDegrees {center.latitude + height / 2}
    func boundarySouth()    -> CLLocationDegrees {center.latitude - height / 2}
    func boundaryEast()     -> CLLocationDegrees {center.longitude + width / 2}
    func boundaryWest()     -> CLLocationDegrees {center.longitude - width / 2}
    func regionPadding()    -> CLLocationDegrees {cellWidth()*2}
 
    let columnLabels = ["A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T"]
    func columnCount()  -> Int {columnLabels.count}
    func rowCount()     -> Int {16}
    func cellWidth()    -> CLLocationDegrees {width / CLLocationDegrees(columnCount())}
    func cellHeight()   -> CLLocationDegrees {height / CLLocationDegrees(rowCount())}
    
    func region() -> MKCoordinateRegion {
            return MKCoordinateRegion(
                center: center,
                span: MKCoordinateSpan(
                    latitudeDelta: height + regionPadding(),
                    longitudeDelta: width + regionPadding())
            )
    }
    
    func overlay() -> some MapContent {
        let gridColor: Color = .white

     
        return Group {
            MapPolyline(coordinates: gridLines()).stroke(gridColor, lineWidth: 1)
            
            Annotation("",coordinate: labelCoords(bar:.top, i: 0)) {Text("A").foregroundStyle(gridColor).font(.title2)}
            Annotation("",coordinate: labelCoords(bar:.top, i: 1)) {Text("B").foregroundStyle(gridColor).font(/*@START_MENU_TOKEN@*/.title2/*@END_MENU_TOKEN@*/)}
            Annotation("",coordinate: labelCoords(bar:.top, i: 2)) {Text("C").foregroundStyle(gridColor).font(/*@START_MENU_TOKEN@*/.title2/*@END_MENU_TOKEN@*/)}
            Annotation("",coordinate: labelCoords(bar:.top, i: 3)) {Text("D").foregroundStyle(gridColor).font(/*@START_MENU_TOKEN@*/.title2/*@END_MENU_TOKEN@*/)}
            Annotation("",coordinate: labelCoords(bar:.top, i: 4)) {Text("E").foregroundStyle(gridColor).font(/*@START_MENU_TOKEN@*/.title2/*@END_MENU_TOKEN@*/)}
            Annotation("",coordinate: labelCoords(bar:.top, i: 5)) {Text("F").foregroundStyle(gridColor).font(/*@START_MENU_TOKEN@*/.title2/*@END_MENU_TOKEN@*/)}
            Annotation("",coordinate: labelCoords(bar:.top, i: 6)) {Text("G").foregroundStyle(gridColor).font(/*@START_MENU_TOKEN@*/.title2/*@END_MENU_TOKEN@*/)}
            Annotation("",coordinate: labelCoords(bar:.top, i: 7)) {Text("H").foregroundStyle(gridColor).font(/*@START_MENU_TOKEN@*/.title2/*@END_MENU_TOKEN@*/)}
            Annotation("",coordinate: labelCoords(bar:.top, i: 8)) {Text("I").foregroundStyle(gridColor).font(/*@START_MENU_TOKEN@*/.title2/*@END_MENU_TOKEN@*/)}
            Annotation("",coordinate: labelCoords(bar:.top, i: 9)) {Text("J").foregroundStyle(gridColor).font(/*@START_MENU_TOKEN@*/.title2/*@END_MENU_TOKEN@*/)}
            Annotation("",coordinate: labelCoords(bar:.top, i:10)) {Text("K").foregroundStyle(gridColor).font(/*@START_MENU_TOKEN@*/.title2/*@END_MENU_TOKEN@*/)}
            Annotation("",coordinate: labelCoords(bar:.top, i:11)) {Text("L").foregroundStyle(gridColor).font(/*@START_MENU_TOKEN@*/.title2/*@END_MENU_TOKEN@*/)}
            Annotation("",coordinate: labelCoords(bar:.top, i:12)) {Text("M").foregroundStyle(gridColor).font(/*@START_MENU_TOKEN@*/.title2/*@END_MENU_TOKEN@*/)}
            Annotation("",coordinate: labelCoords(bar:.top, i:13)) {Text("N").foregroundStyle(gridColor).font(/*@START_MENU_TOKEN@*/.title2/*@END_MENU_TOKEN@*/)}
            Annotation("",coordinate: labelCoords(bar:.top, i:14)) {Text("O").foregroundStyle(gridColor).font(/*@START_MENU_TOKEN@*/.title2/*@END_MENU_TOKEN@*/)}
            Annotation("",coordinate: labelCoords(bar:.top, i:15)) {Text("P").foregroundStyle(gridColor).font(/*@START_MENU_TOKEN@*/.title2/*@END_MENU_TOKEN@*/)}
            Annotation("",coordinate: labelCoords(bar:.top, i:16)) {Text("Q").foregroundStyle(gridColor).font(/*@START_MENU_TOKEN@*/.title2/*@END_MENU_TOKEN@*/)}
            Annotation("",coordinate: labelCoords(bar:.top, i:17)) {Text("R").foregroundStyle(gridColor).font(/*@START_MENU_TOKEN@*/.title2/*@END_MENU_TOKEN@*/)}
            Annotation("",coordinate: labelCoords(bar:.top, i:18)) {Text("S").foregroundStyle(gridColor).font(/*@START_MENU_TOKEN@*/.title2/*@END_MENU_TOKEN@*/)}
            Annotation("",coordinate: labelCoords(bar:.top, i:19)) {Text("T").foregroundStyle(gridColor).font(/*@START_MENU_TOKEN@*/.title2/*@END_MENU_TOKEN@*/)}
       
            Annotation("",coordinate: labelCoords(bar:.bottom, i: 0)) {Text("A").foregroundStyle(gridColor).font(/*@START_MENU_TOKEN@*/.title2/*@END_MENU_TOKEN@*/)}
            Annotation("",coordinate: labelCoords(bar:.bottom, i: 1)) {Text("B").foregroundStyle(gridColor).font(/*@START_MENU_TOKEN@*/.title2/*@END_MENU_TOKEN@*/)}
            Annotation("",coordinate: labelCoords(bar:.bottom, i: 2)) {Text("C").foregroundStyle(gridColor).font(/*@START_MENU_TOKEN@*/.title2/*@END_MENU_TOKEN@*/)}
            Annotation("",coordinate: labelCoords(bar:.bottom, i: 3)) {Text("D").foregroundStyle(gridColor).font(/*@START_MENU_TOKEN@*/.title2/*@END_MENU_TOKEN@*/)}
            Annotation("",coordinate: labelCoords(bar:.bottom, i: 4)) {Text("E").foregroundStyle(gridColor).font(/*@START_MENU_TOKEN@*/.title2/*@END_MENU_TOKEN@*/)}
            Annotation("",coordinate: labelCoords(bar:.bottom, i: 5)) {Text("F").foregroundStyle(gridColor).font(/*@START_MENU_TOKEN@*/.title2/*@END_MENU_TOKEN@*/)}
            Annotation("",coordinate: labelCoords(bar:.bottom, i: 6)) {Text("G").foregroundStyle(gridColor).font(/*@START_MENU_TOKEN@*/.title2/*@END_MENU_TOKEN@*/)}
            Annotation("",coordinate: labelCoords(bar:.bottom, i: 7)) {Text("H").foregroundStyle(gridColor).font(/*@START_MENU_TOKEN@*/.title2/*@END_MENU_TOKEN@*/)}
            Annotation("",coordinate: labelCoords(bar:.bottom, i: 8)) {Text("I").foregroundStyle(gridColor).font(/*@START_MENU_TOKEN@*/.title2/*@END_MENU_TOKEN@*/)}
            Annotation("",coordinate: labelCoords(bar:.bottom, i: 9)) {Text("J").foregroundStyle(gridColor).font(/*@START_MENU_TOKEN@*/.title2/*@END_MENU_TOKEN@*/)}
            Annotation("",coordinate: labelCoords(bar:.bottom, i:10)) {Text("K").foregroundStyle(gridColor).font(/*@START_MENU_TOKEN@*/.title2/*@END_MENU_TOKEN@*/)}
            Annotation("",coordinate: labelCoords(bar:.bottom, i:11)) {Text("L").foregroundStyle(gridColor).font(/*@START_MENU_TOKEN@*/.title2/*@END_MENU_TOKEN@*/)}
            Annotation("",coordinate: labelCoords(bar:.bottom, i:12)) {Text("M").foregroundStyle(gridColor).font(/*@START_MENU_TOKEN@*/.title2/*@END_MENU_TOKEN@*/)}
            Annotation("",coordinate: labelCoords(bar:.bottom, i:13)) {Text("N").foregroundStyle(gridColor).font(/*@START_MENU_TOKEN@*/.title2/*@END_MENU_TOKEN@*/)}
            Annotation("",coordinate: labelCoords(bar:.bottom, i:14)) {Text("O").foregroundStyle(gridColor).font(/*@START_MENU_TOKEN@*/.title2/*@END_MENU_TOKEN@*/)}
            Annotation("",coordinate: labelCoords(bar:.bottom, i:15)) {Text("P").foregroundStyle(gridColor).font(/*@START_MENU_TOKEN@*/.title2/*@END_MENU_TOKEN@*/)}
            Annotation("",coordinate: labelCoords(bar:.bottom, i:16)) {Text("Q").foregroundStyle(gridColor).font(/*@START_MENU_TOKEN@*/.title2/*@END_MENU_TOKEN@*/)}
            Annotation("",coordinate: labelCoords(bar:.bottom, i:17)) {Text("R").foregroundStyle(gridColor).font(/*@START_MENU_TOKEN@*/.title2/*@END_MENU_TOKEN@*/)}
            Annotation("",coordinate: labelCoords(bar:.bottom, i:18)) {Text("S").foregroundStyle(gridColor).font(/*@START_MENU_TOKEN@*/.title2/*@END_MENU_TOKEN@*/)}
            Annotation("",coordinate: labelCoords(bar:.bottom, i:19)) {Text("T").foregroundStyle(gridColor).font(/*@START_MENU_TOKEN@*/.title2/*@END_MENU_TOKEN@*/)}

            Annotation("",coordinate: labelCoords(bar:.left, i: 0)) {Text("1").foregroundStyle(gridColor).font(/*@START_MENU_TOKEN@*/.title2/*@END_MENU_TOKEN@*/)}
            Annotation("",coordinate: labelCoords(bar:.left, i: 1)) {Text("2").foregroundStyle(gridColor).font(/*@START_MENU_TOKEN@*/.title2/*@END_MENU_TOKEN@*/)}
            Annotation("",coordinate: labelCoords(bar:.left, i: 2)) {Text("3").foregroundStyle(gridColor).font(/*@START_MENU_TOKEN@*/.title2/*@END_MENU_TOKEN@*/)}
            Annotation("",coordinate: labelCoords(bar:.left, i: 3)) {Text("4").foregroundStyle(gridColor).font(/*@START_MENU_TOKEN@*/.title2/*@END_MENU_TOKEN@*/)}
            Annotation("",coordinate: labelCoords(bar:.left, i: 4)) {Text("5").foregroundStyle(gridColor).font(/*@START_MENU_TOKEN@*/.title2/*@END_MENU_TOKEN@*/)}
            Annotation("",coordinate: labelCoords(bar:.left, i: 5)) {Text("6").foregroundStyle(gridColor).font(/*@START_MENU_TOKEN@*/.title2/*@END_MENU_TOKEN@*/)}
            Annotation("",coordinate: labelCoords(bar:.left, i: 6)) {Text("7").foregroundStyle(gridColor).font(/*@START_MENU_TOKEN@*/.title2/*@END_MENU_TOKEN@*/)}
            Annotation("",coordinate: labelCoords(bar:.left, i: 7)) {Text("8").foregroundStyle(gridColor).font(/*@START_MENU_TOKEN@*/.title2/*@END_MENU_TOKEN@*/)}
            Annotation("",coordinate: labelCoords(bar:.left, i: 8)) {Text("9").foregroundStyle(gridColor).font(/*@START_MENU_TOKEN@*/.title2/*@END_MENU_TOKEN@*/)}
            Annotation("",coordinate: labelCoords(bar:.left, i: 9)) {Text("10").foregroundStyle(gridColor).font(/*@START_MENU_TOKEN@*/.title2/*@END_MENU_TOKEN@*/)}
            Annotation("",coordinate: labelCoords(bar:.left, i:10)) {Text("11").foregroundStyle(gridColor).font(/*@START_MENU_TOKEN@*/.title2/*@END_MENU_TOKEN@*/)}
            Annotation("",coordinate: labelCoords(bar:.left, i:11)) {Text("12").foregroundStyle(gridColor).font(/*@START_MENU_TOKEN@*/.title2/*@END_MENU_TOKEN@*/)}
            Annotation("",coordinate: labelCoords(bar:.left, i:12)) {Text("13").foregroundStyle(gridColor).font(/*@START_MENU_TOKEN@*/.title2/*@END_MENU_TOKEN@*/)}
            Annotation("",coordinate: labelCoords(bar:.left, i:13)) {Text("14").foregroundStyle(gridColor).font(/*@START_MENU_TOKEN@*/.title2/*@END_MENU_TOKEN@*/)}
            Annotation("",coordinate: labelCoords(bar:.left, i:14)) {Text("15").foregroundStyle(gridColor).font(/*@START_MENU_TOKEN@*/.title2/*@END_MENU_TOKEN@*/)}
            Annotation("",coordinate: labelCoords(bar:.left, i:15)) {Text("16").foregroundStyle(gridColor).font(/*@START_MENU_TOKEN@*/.title2/*@END_MENU_TOKEN@*/)}
            
            Annotation("",coordinate: labelCoords(bar:.right, i: 0)) {Text("1").foregroundStyle(gridColor).font(/*@START_MENU_TOKEN@*/.title2/*@END_MENU_TOKEN@*/)}
            Annotation("",coordinate: labelCoords(bar:.right, i: 1)) {Text("2").foregroundStyle(gridColor).font(/*@START_MENU_TOKEN@*/.title2/*@END_MENU_TOKEN@*/)}
            Annotation("",coordinate: labelCoords(bar:.right, i: 2)) {Text("3").foregroundStyle(gridColor).font(/*@START_MENU_TOKEN@*/.title2/*@END_MENU_TOKEN@*/)}
            Annotation("",coordinate: labelCoords(bar:.right, i: 3)) {Text("4").foregroundStyle(gridColor).font(/*@START_MENU_TOKEN@*/.title2/*@END_MENU_TOKEN@*/)}
            Annotation("",coordinate: labelCoords(bar:.right, i: 4)) {Text("5").foregroundStyle(gridColor).font(/*@START_MENU_TOKEN@*/.title2/*@END_MENU_TOKEN@*/)}
            Annotation("",coordinate: labelCoords(bar:.right, i: 5)) {Text("6").foregroundStyle(gridColor).font(/*@START_MENU_TOKEN@*/.title2/*@END_MENU_TOKEN@*/)}
            Annotation("",coordinate: labelCoords(bar:.right, i: 6)) {Text("7").foregroundStyle(gridColor).font(/*@START_MENU_TOKEN@*/.title2/*@END_MENU_TOKEN@*/)}
            Annotation("",coordinate: labelCoords(bar:.right, i: 7)) {Text("8").foregroundStyle(gridColor).font(/*@START_MENU_TOKEN@*/.title2/*@END_MENU_TOKEN@*/)}
            Annotation("",coordinate: labelCoords(bar:.right, i: 8)) {Text("9").foregroundStyle(gridColor).font(/*@START_MENU_TOKEN@*/.title2/*@END_MENU_TOKEN@*/)}
            Annotation("",coordinate: labelCoords(bar:.right, i: 9)) {Text("10").foregroundStyle(gridColor).font(/*@START_MENU_TOKEN@*/.title2/*@END_MENU_TOKEN@*/)}
            Annotation("",coordinate: labelCoords(bar:.right, i:10)) {Text("11").foregroundStyle(gridColor).font(/*@START_MENU_TOKEN@*/.title2/*@END_MENU_TOKEN@*/)}
            Annotation("",coordinate: labelCoords(bar:.right, i:11)) {Text("12").foregroundStyle(gridColor).font(/*@START_MENU_TOKEN@*/.title2/*@END_MENU_TOKEN@*/)}
            Annotation("",coordinate: labelCoords(bar:.right, i:12)) {Text("13").foregroundStyle(gridColor).font(/*@START_MENU_TOKEN@*/.title2/*@END_MENU_TOKEN@*/)}
            Annotation("",coordinate: labelCoords(bar:.right, i:13)) {Text("14").foregroundStyle(gridColor).font(/*@START_MENU_TOKEN@*/.title2/*@END_MENU_TOKEN@*/)}
            Annotation("",coordinate: labelCoords(bar:.right, i:14)) {Text("15").foregroundStyle(gridColor).font(/*@START_MENU_TOKEN@*/.title2/*@END_MENU_TOKEN@*/)}
            Annotation("",coordinate: labelCoords(bar:.right, i:15)) {Text("16").foregroundStyle(gridColor).font(/*@START_MENU_TOKEN@*/.title2/*@END_MENU_TOKEN@*/)}
        }
    }
    
    func cellAddress(coordinate: CLLocationCoordinate2D) -> String {
        var address: String = "Off Grid"
        
        if onGrid(coordinate: coordinate){
                address = columnLabels[Int((coordinate.longitude - boundaryWest()) / cellWidth())]
                address += String((rowCount() - Int((coordinate.latitude - boundarySouth()) / cellHeight())))
        }
        return address
    }
    
    func cellRegion(coordinate: CLLocationCoordinate2D) -> MKCoordinateRegion {
        var cell: CellCoordinates = CellCoordinates(row: 0, col: 0)
        var center: CLLocationCoordinate2D = CLLocationCoordinate2D(latitude: 0, longitude: 0)
        
        cell = cellCoordinates(coordinate: coordinate)
        center.latitude = boundaryNorth() - cellHeight() * (Double(cell.row) + 0.5)
        center.longitude = boundaryWest() + cellWidth() * (Double(cell.col) + 0.5)
        return MKCoordinateRegion(
            center: center,
            span: MKCoordinateSpan(
                latitudeDelta: cellHeight() * 1.5,
                longitudeDelta: cellWidth() * 1.5)
        )
    }
    
    func cellCoordinates(coordinate: CLLocationCoordinate2D) -> CellCoordinates {
        var cell: CellCoordinates = CellCoordinates(row: 0, col: 0)
        
        cell.col = Int((coordinate.longitude - boundaryWest()) / cellWidth())
        if cell.col < 0 {
            cell.col = 0
        }
        if cell.col >= columnCount() {
            cell.col = columnCount() - 1
        }
        cell.row = rowCount()-1-Int((coordinate.latitude-boundarySouth())/cellHeight())
        if cell.row < 0 {
            cell.row = 0
        }
        if cell.row >= rowCount() {
            cell.row = rowCount() - 1
        }
        return cell
    }
    
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


}






