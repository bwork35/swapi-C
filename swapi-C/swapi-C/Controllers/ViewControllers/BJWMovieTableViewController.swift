//
//  BJWMovieTableViewController.swift
//  swapi-C
//
//  Created by Bryan Workman on 6/26/20.
//  Copyright © 2020 Bryan Workman. All rights reserved.
//

import UIKit

class BJWMovieTableViewController: UITableViewController {

    var movies: [BJWMovie] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "space")!)
        fetchMovies()
    }
    
    func fetchMovies() {
        BJWMovieController.fetchMovies { (movieResults) in
            self.movies = movieResults
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return movies.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "movieCell", for: indexPath) as? BJWMovieTableViewCell else {return UITableViewCell()}
        
        let movie = movies[indexPath.row]
        cell.movie = movie
       
        return cell
    }
}
