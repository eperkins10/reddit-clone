//
//  Post.swift
//  Reddit
//
//  Created by Ethan Perkins on 12/1/21.
//

import Foundation

struct TopLevelObject: Decodable {
    let data: SecondLevelObject
    
}

struct SecondLevelObject: Decodable {
    let children: [ThirdLevelObject]
}

struct ThirdLevelObject: Decodable {
    let data: Post
}

struct Post: Decodable {
    let title: String
    let ups: Int
    let thumbnail: String
}
