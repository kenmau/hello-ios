//
//  PostData.swift
//  H4X0R News
//
//  Created by Ken Mau on 2022-01-10.
//

import Foundation

struct Results: Decodable {
    let hits: [Post]
}

struct Post: Decodable, Identifiable {
    var id: String {
        return objectID
    }
    let objectID: String
    let title: String
    let points: Int
    let url : String?
}
