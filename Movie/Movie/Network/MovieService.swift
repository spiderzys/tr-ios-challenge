//
//  UserService.swift
//  User
//
//  Created by Yangsheng Zou on 2021-01-01.
//  Copyright © 2021 Yangsheng. All rights reserved.
//

import Moya
import Foundation

enum MovieService {
    case getMovieList
    case getMovieDetail(id:Int)
    case getRecommendedMovies(id:Int)
}


extension MovieService: TargetType {
    
    
    var baseURL: URL {
       
        return URL(string: "https://raw.githubusercontent.com/TradeRev/tr-ios-challenge/master")!
    }
    
    var path: String {
        switch self {
        case .getMovieList:
            return "/list.json"
        case .getMovieDetail(let id):
            return "/details/\(id).json"
        case .getRecommendedMovies(let id):
            return "/details/recommended/\(id).json"
        }
       
    }
    
    var method: Moya.Method {
        return .get
    }
    
    var sampleData: Data {
        return Data()
    }
    
    var task: Task {
        return .requestPlain
    }
    
    var headers: [String : String]? {
        return nil
    }
    
  
}
