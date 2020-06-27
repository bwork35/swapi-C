//
//  BJWMovieTableViewCell.swift
//  swapi-C
//
//  Created by Bryan Workman on 6/26/20.
//  Copyright © 2020 Bryan Workman. All rights reserved.
//

import UIKit

class BJWMovieTableViewCell: UITableViewCell {

    //MARK: - Outlets
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var releaseDateLabel: UILabel!
    @IBOutlet weak var openingCrawlLabel: UILabel!
    @IBOutlet weak var episodeLabel: UILabel!
    
    //MARK: -Landing Pad
    
    var movie: BJWMovie? {
        didSet {
            updateViews()
        }
    }
    
    //MARK: -Methods
    func updateViews() {
        
        guard let movie = movie else {return}
        titleLabel.text = movie.title
        releaseDateLabel.text = "release date: " + movie.releaseDate
        openingCrawlLabel.text = movie.openingCrawl
        episodeLabel.text = "episode \(movie.episode)"
    }
}
