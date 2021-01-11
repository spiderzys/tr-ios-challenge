//
//  MovieDetailViewModel.swift
//  Movie
//
//  Created by Yangsheng Zou on 2021-01-08.
//  Copyright © 2021 Yangsheng. All rights reserved.
//

import Foundation

class MovieDetailViewModel:MovieViewModel {
    var coordinator: MovieSceneCoordiantor?
    
    let movie: DetailedMovie
    var recommendation = [ListedMovie]()
    
    
    init(movie:DetailedMovie) {
        self.movie = movie
    }
    
    
    func movieViewModel(row:Int) -> RecommendedMovieCellViewModel?{
        let viewModel = RecommendedMovieCellViewModel(movie: recommendation[row])
        return viewModel
        
    }
    
    func updateRecommendation(success: @escaping () -> Void, failure: @escaping(Error) -> Void) {
        // get the recommendation movie collection
        self.findRecommendation(movie: movie, success: { (movies) in
            self.recommendation = movies
            success()
        }, failure: failure)
    }
    
    func visitMovie(_ row:Int, detailFailed: @escaping (Error) -> Void) {
        // show movie detail
        self.visitMovie(recommendation[row], detailFailed: detailFailed)
    }
}
