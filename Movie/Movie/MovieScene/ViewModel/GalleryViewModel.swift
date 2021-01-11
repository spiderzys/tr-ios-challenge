//
//  GalleryViewModel.swift
//  Movie
//
//  Created by Yangsheng Zou on 2021-01-08.
//  Copyright © 2021 Yangsheng. All rights reserved.
//

import Foundation

class GalleryViewModel:MovieViewModel {
   
    
    var coordinator: MovieSceneCoordiantor?
    var movies = [ListedMovie]()
    
    
    
    func movieViewModel(row:Int) -> ListedMovieCellViewModel?{
        let viewModel = ListedMovieCellViewModel(movie: movies[row])
        return viewModel
        
    }
    
    
    func getListedMovies(success: @escaping () -> Void, failure: @escaping (Error) ->Void) {
        // get the list of the movies
        API.shared.getListedMovies(success: { (movies) in
            self.movies = movies
            success()
        }, failure: failure)
    }
    
    
   
    
    func visitMovie(_ row:Int, detailFailed: @escaping (Error) -> Void) {
        // show movie detail
        self.visitMovie(movies[row], detailFailed: detailFailed)
    }
    
    
 
    
}
