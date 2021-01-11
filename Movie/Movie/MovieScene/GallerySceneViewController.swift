//
//  GallerySceneViewController.swift
//  Movie
//
//  Created by Yangsheng Zou on 2021-01-08.
//  Copyright © 2021 Yangsheng. All rights reserved.
//


import Reusable
import UIKit

protocol GallerySceneViewController: StoryboardSceneBased {
    
}

extension GallerySceneViewController {
    static var sceneStoryboard: UIStoryboard {
        return UIStoryboard(name: "Movie", bundle: nil)
    }
}
