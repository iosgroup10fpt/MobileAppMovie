//
//  DetailController.swift
//  MovieApp-master
//
//  Created by Tai Nhat Huynh on 6/10/17.
//  Copyright © 2017 Dau Khac Bac. All rights reserved.
//

import Foundation
class Movie {
    
    var poster_path: String!
    var adult: Bool!
    var overview: String!
    var release_date: String!
    var genre_ids: [Int]!
    var id: Int!
    var original_title: String!
    var original_language: String!
    var title: String!
    var backdrop_path: String!
    var popularity: Double!
    var vote_count: Int!
    var video: Bool!
    var vote_average: Double!
    var today: [Schedule]?
    var tomorrow: [Schedule]?
    init(json: [String:Any]) {
        poster_path             = json["poster_path"]       as? String
        adult                   = json["adult"]             as? Bool
        overview                = json["overview"]          as? String
        release_date            = json["release_date"]      as? String
        genre_ids               = json["genre_ids"]         as? [Int]
        id                      = json["id"]                as? Int
        original_title          = json["original_title"]    as? String
        original_language       = json["original_language"] as? String
        title                   = json["title"]             as? String
        backdrop_path           = json["backdrop_path"]     as? String
        popularity              = json["popularity"]        as? Double
        vote_count              = json["vote_count"]        as? Int
        video                   = json["video"]             as? Bool
        vote_average            = json["vote_average"]      as? Double

    }
    
}
