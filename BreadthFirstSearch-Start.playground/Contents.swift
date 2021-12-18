//: Playground - noun: a place where people can play

import UIKit
import XCPlayground

enum Visit<Element: Hashable> {
    case source
    case edge(Edge<Element>)
}

extension Graphable {
    public func breadthFirstSearch(from source: Vertex<Element>, to destination: Vertex<Element>) -> [Edge<Element>]? {
        
        // Start at the source
        
        var queue = Queue<Vertex<Element>>()
        queue.enqueue(source)
        
        var visits: [Vertex<Element>: Visit<Element>] = [source: .source]
        
        // Need to keep track the verticies we visit
//        var enqueuedVerticies = Set<Vertex<Element>>()
        
        while let visitedVertex = queue.dequeue() {
            // If source == destionation, return empty array
            if visitedVertex == destination {
                var vertex = destination
                var route: [Edge<Element>] = []
                
                while let visit = visits[vertex], case .edge(let edge) = visit {
                    route = [edge] + route
                    vertex = edge.source
                }
                
                return route
            }
            
            // Visit each neighbouring vertex.
            let neighbouringEdges = edges(from: visitedVertex) ?? []
            for edge in neighbouringEdges {
//                if !enqueuedVerticies.contains(edge.destination) {
                if visits[edge.destination] == nil {
//                    enqueuedVerticies.insert(visitedVertex)
                    queue.enqueue(edge.destination)
                    visits[edge.destination] = .edge(edge)
                }
            }
            
            // Return a list of edges taking me from the source to the destination
        }
        
        // If route does not exist, return nil
        return nil
    }
}

let dungeon = AdjacencyList<String>()

let entranceRoom = dungeon.createVertex(data: "Entrance")
let spiderRoom = dungeon.createVertex(data: "Spider")
let goblinRoom = dungeon.createVertex(data: "Goblin")
let ratRoom = dungeon.createVertex(data: "Rat")
let knightRoom = dungeon.createVertex(data: "Knight")
let batRoom = dungeon.createVertex(data: "Bat")
let orcRoom = dungeon.createVertex(data: "Orc")
let keyRoom = dungeon.createVertex(data: "Key")
let treasureRoom = dungeon.createVertex(data: "Treasure")

dungeon.add(.undirected, from: entranceRoom, to: spiderRoom, weight: 1)
dungeon.add(.undirected, from: entranceRoom, to: ratRoom, weight: 1)
dungeon.add(.undirected, from: entranceRoom, to: batRoom, weight: 1)
dungeon.add(.undirected, from: spiderRoom, to: goblinRoom, weight: 1)
dungeon.add(.undirected, from: spiderRoom, to: orcRoom, weight: 1)
dungeon.add(.undirected, from: ratRoom, to: treasureRoom, weight: 1)
dungeon.add(.undirected, from: ratRoom, to: keyRoom, weight: 1)
dungeon.add(.undirected, from: batRoom, to: knightRoom, weight: 1)

dungeon.description

if let edges = dungeon.breadthFirstSearch(from: entranceRoom, to: treasureRoom) {
    for edge in edges {
        print("\(edge.source) -> \(edge.destination)")
    }
}
