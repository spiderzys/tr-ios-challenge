//
//  Model.swift
//  Movie
//
//  Created by Yangsheng Zou on 2021-01-08.
//  Copyright © 2021 Yangsheng. All rights reserved.
//

import Foundation



protocol Movie: Decodable {
    var id:Int {get}
    var name:String {get}
}


struct ListedMovie: Movie {
    let id: Int
    let name: String
    let thumbnail:String
    let year:Int
    
}


struct DetailedMovie: Movie {
    let id: Int
    let name: String
    let rating:Double
    let description:String
    let timeStamp:Double
    let pictureUrl:String
    let notes:String
    
    
    private enum CodingKeys :String, CodingKey {
        case id, name, rating = "Rating", description = "Description", timeStamp = "releaseDate",pictureUrl = "picture", notes = "Notes"
        
    }
    
    
}



struct MovieListRequestResult:Decodable {
    let movies: [ListedMovie]
    
}

typealias RecommendedMovie = ListedMovie
