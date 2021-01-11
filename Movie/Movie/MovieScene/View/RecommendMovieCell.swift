//
//  CollectionViewCell.swift
//  Movie
//
//  Created by Yangsheng Zou on 2021-01-08.
//  Copyright © 2021 Yangsheng. All rights reserved.
//

import UIKit
import Reusable
import Nuke

class RecommendMovieCell: UICollectionViewCell, NibReusable {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    
    var viewModel:RecommendedMovieCellViewModel? {
        didSet {
            updateUI()
        }
    }
    
    
    func updateUI() {
        guard let movie = viewModel?.movie else {return}
        self.titleLabel.text = movie.name
        guard let url = URL(string: movie.thumbnail) else {return}
        Nuke.loadImage(with: url, into: imageView)
    }
}
