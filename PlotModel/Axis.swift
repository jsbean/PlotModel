//
//  Axis.swift
//  PlotModel
//
//  Created by James Bean on 1/14/17.
//
//

/// Interface for types that (abstractly or concretely) defines a coordinate space.
public protocol Axis {
    
    /// An element which is transformed into a `Position`.
    associatedtype Element
    
    /// Type describing a point in some coordinate system.
    associatedtype Coordinate
    
    /// Calculate a position for the given entity.
    var coordinate: (Element) -> Coordinate { get }
}

/// Axis which does not transform its element when constructing its coordinate.
public struct DefaultAxis <T>: Axis {
    
    /// - Returns: Element as coordinate.
    public var coordinate: (T) -> T = { t in t }
    
    /// Create a `DefaultAxis`.
    public init() { }
}
