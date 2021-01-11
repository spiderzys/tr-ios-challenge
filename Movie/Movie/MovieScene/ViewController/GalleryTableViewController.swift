//
//  GalleryTableViewController.swift
//  Movie
//
//  Created by Yangsheng Zou on 2021-01-08.
//  Copyright © 2021 Yangsheng. All rights reserved.
//

import UIKit
import Reusable

class GalleryTableViewController: UITableViewController, GallerySceneViewController {
    
    

    var viewModel = GalleryViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.register(cellType: ListedMovieCell.self)
        viewModel.getListedMovies(success: {
            self.tableView.reloadData()
        }) { (error) in
            print(error)
        }
        
    }
    
    
   
    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return viewModel.movies.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: ListedMovieCell = tableView.dequeueReusableCell(for: indexPath)
        cell.viewModel = self.viewModel.movieViewModel(row: indexPath.row)
        return cell
    }
    
    
    
    
    // MARK: - Table view delegate
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        viewModel.visitMovie(indexPath.row, detailFailed: { error in
            print(error)
        })
        
    }

    

}
