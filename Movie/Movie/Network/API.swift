//
//  API.swift
//  User
//
//  Created by Yangsheng Zou on 2020-11-01.
//  Copyright © 2020 Yangsheng. All rights reserved.
//

import Foundation
import Moya

class API {
    // manage api call
    let decoder = JSONDecoder()
    
    static let shared = API()
    let userServiceProvider = MoyaProvider<MovieService>()
    
    
    
    func getListedMovies(success:  @escaping ([ListedMovie]) -> Void, failure: @escaping (Error) ->Void) {
        // get movie of list
        request(.getMovieList, success: { (result:MovieListRequestResult) in
            let movies = result.movies
            success(movies)
        }, failure: failure)
    }
    
    func getRecommendMovie(movie: Movie, success:  @escaping ([RecommendedMovie]) -> Void, failure: @escaping (Error) ->Void) {
        // get recommended movies
        request(.getRecommendedMovies(id: movie.id),  success: { (result:MovieListRequestResult) in
            let movies = result.movies
            success(movies)
        }, failure: failure)
    }
    
    
    func getMovieDetail(movie:Movie,success: @escaping (DetailedMovie) -> Void, failure: @escaping (Error) ->Void) {
        // get the detail of the movie
        request(.getMovieDetail(id: movie.id), success: success, failure: failure)
    }
    
    
    
    private func request<T:Decodable>(_ service: MovieService,success: @escaping (T) -> Void, failure: @escaping (Error) ->Void) {
        // general json request
        userServiceProvider.request(service) { (result) in
            switch result {
            case .success(let response):
                let data = response.data
                self.decoder.decode(data: data, success: { (movies:T) in
                    success(movies)
                }) { (error) in
                    failure(error)
                }
                    
                
                
            case .failure(let error):
                failure(error)
               
            }
        
        }
    }
    
   
    
    
    
    
    
}
