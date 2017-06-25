//
//  PlotModel.swift
//  PlotModel
//
//  Created by James Bean on 1/14/17.
//
//

import Collections

/// Model represented by a `PlotView`.
public protocol PlotModel: AnyCollectionWrapping {

    /// Model of a single point within a `PlotModel`.
    associatedtype Point: PointModel
    
    /// The thing the needs to be converted into vertical dimension.
    associatedtype Entity
    
    /// Type that describes the abstract vertical coordinate system of a `PlotView`.
    ///
    /// For example, `Staff` implements this as `StaffSlot`.
    associatedtype VerticalCoordinate: Hashable
    
    /// Type that describes the abstract horizontal coordinate system of a `PlotView`.
    associatedtype HorizontalCoordinate: Hashable
    
    /// Type that describes the coordinates of a given `Point`.
    associatedtype Position: Hashable
    
    /// Type that converts a given type of musical element to `AbstractVerticalPosition`.
    associatedtype VerticalAxis: Axis
    
    /// Type that converts a given type of musical element to `AbstractHorizontalPosition`.
    associatedtype HorizontalAxis: Axis

    /// Determines the way that information is mapped onto the vertical axis.
    var verticalAxis: VerticalAxis { get }
    
    /// Determines the way that information is mapped onto the horizontal axis.
    var horizontalAxis: HorizontalAxis { get }
    
    /// Array of points contained herein.
    var points: [Position: [Point]] { get }
    
    /// Type-erased view of `points` array.
    var collection: AnyCollection<Point> { get }
}

extension PlotModel {
    
    /// Type-erased view of `points` array.
    public var collection: AnyCollection<(Position, [Point])> {
        return AnyCollection(points.map { $0 })
    }
}
