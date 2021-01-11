//
//  ViewModel.swift
//  User
//
//  Created by Yangsheng Zou on 2021-01-01.
//  Copyright © 2021 Yangsheng. All rights reserved.
//

import Foundation



protocol MovieViewModel {
    func findDetail(movie:Movie, success:@escaping (DetailedMovie) -> Void, failure:@escaping (Error) -> Void )
        
    var coordinator: MovieSceneCoordiantor? {get set}
}

extension MovieViewModel {
    
    func findDetail(movie:Movie, success:@escaping (DetailedMovie) -> Void, failure:@escaping (Error) -> Void ) {
        API.shared.getMovieDetail(movie: movie, success: success, failure: failure)
    }
    
    func findRecommendation(movie:Movie,success:@escaping ([RecommendedMovie]) -> Void, failure:@escaping (Error) -> Void ) {
        API.shared.getRecommendMovie(movie: movie, success: success, failure: failure)
    }
    
    func visitMovie(_ movie: Movie, detailFailed: @escaping (Error) -> Void) {
        self.findDetail(movie: movie, success: { (movie) in
            self.coordinator?.showMovieDetail(movie:movie)
        }) { (error) in
            detailFailed(error)
        }
        
    }
}
