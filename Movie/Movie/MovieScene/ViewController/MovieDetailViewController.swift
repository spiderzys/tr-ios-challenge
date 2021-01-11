//
//  MovieDetailViewController.swift
//  Movie
//
//  Created by Yangsheng Zou on 2021-01-08.
//  Copyright © 2021 Yangsheng. All rights reserved.
//

import UIKit
import Reusable
import Nuke

class MovieDetailViewController: UIViewController, GallerySceneViewController {
    
    var viewModel: MovieDetailViewModel?

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var recommendCollectionView: UICollectionView!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var plotLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        recommendCollectionView.dataSource = self
        recommendCollectionView.delegate = self
        self.recommendCollectionView.register(cellType: RecommendMovieCell.self)
        updateUI()
        viewModel?.updateRecommendation(success: {
            self.recommendCollectionView.reloadData()
        }, failure: { (error) in
            print(error)
        })
        // Do any additional setup after loading the view.
    }
    
    
    func updateUI() {
        // configure UI based on the detail of the movie
        guard let movie = self.viewModel?.movie else {return}
        self.titleLabel.text = movie.name
        self.plotLabel.text = movie.notes
        self.descriptionLabel.text = movie.notes
        self.dateLabel.text = Date.dateDescription(timeStamp: movie.timeStamp)
        self.title = movie.name
        guard let url = URL(string: movie.pictureUrl) else {return}
        Nuke.loadImage(with: url, into: self.imageView)
        
        
    }

    
    
    

}


extension MovieDetailViewController:UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel?.recommendation.count ?? 0
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: RecommendMovieCell = collectionView.dequeueReusableCell(for: indexPath)
        cell.viewModel = viewModel?.movieViewModel(row: indexPath.row)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        viewModel?.visitMovie(indexPath.row, detailFailed: { (error) in
            print(error)
        })
    }
}

