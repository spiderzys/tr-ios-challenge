//
//  GallaryScene.swift
//  Movie
//
//  Created by Yangsheng Zou on 2021-01-08.
//  Copyright © 2021 Yangsheng. All rights reserved.
//

import UIKit

class MovieSceneCoordiantor: NSObject, NavigationCoordinator {
    var root: UINavigationController
    
    func start() {
        // present the list of movies
        let galleryViewController = GalleryTableViewController.instantiate()
        galleryViewController.viewModel.coordinator = self
        self.root.pushViewController(galleryViewController, animated: false)
    }
    
    func showMovieDetail(movie:DetailedMovie) {
        // show the detail of the movie
        let movieDetailViewController = MovieDetailViewController.instantiate()
        let viewModel = MovieDetailViewModel(movie: movie)
        viewModel.coordinator = self
        movieDetailViewController.viewModel = viewModel
        self.root.pushViewController(movieDetailViewController, animated: true)
        
        // present movie detail page
    }
    
    init(root:UINavigationController) {
        self.root = root
    }
    
    
    var childCoordinators: [Coordinator] = []
    var parentCoordinator: Coordinator? = nil
    
    
   

    
}
