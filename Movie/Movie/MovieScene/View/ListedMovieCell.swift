//
//  MovieCell.swift
//  Movie
//
//  Created by Yangsheng Zou on 2021-01-08.
//  Copyright © 2021 Yangsheng. All rights reserved.
//

import UIKit
import Reusable
import Nuke

class ListedMovieCell: UITableViewCell,NibReusable {

    @IBOutlet weak var icon: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var yearLabel: UILabel!
    
    var viewModel:ListedMovieCellViewModel? {
        didSet {
            self.updateUI()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    private func updateUI() {
        // configure the email
        guard let movie = self.viewModel?.movie else {return}
        titleLabel.text = movie.name
        yearLabel.text = String(movie.year)
        guard let url = URL(string: movie.thumbnail) else {return}
        Nuke.loadImage(with: url, into: icon)
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    
    
}
