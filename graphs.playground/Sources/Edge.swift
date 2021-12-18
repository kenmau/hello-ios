import Foundation

public enum EdgeType {
    case directed, undirected
}

public struct Edge<T: Hashable> {
    public var source: Vertex<T>
    public var destination: Vertex<T>
    public var weight: Double?
}

extension Edge: Hashable {
    public func hash(into hasher: inout Hasher) {
        hasher.combine("\(source)\(destination)\(weight ?? 0.0))")
    }
    
    static public func ==(lhs: Edge<T>, rhs: Edge<T>) -> Bool {
        return lhs.source == rhs.source && lhs.destination == rhs.destination && lhs.weight == rhs.weight
    }
}
