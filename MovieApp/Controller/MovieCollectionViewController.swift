//
//  MovieCollectionViewController.swift
//  MovieApp
//
//  Created by Nurzhan on 29.03.2022.
//

import UIKit

private let reuseIdentifier = "MovieCollectionViewCell"

class MovieCollectionViewController: UICollectionViewController {
    
    var movies = [Movie]()


    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.dataSource = self
        fetchMovies()
        print(fetchMovies())
    }

    

    // MARK: UICollectionViewDataSource
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return movies.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as? MovieCollectionViewCell
        else { return UICollectionViewCell() }
        let movie = movies[indexPath.item]
        cell.configure(with: movie, indx: indexPath)
    
    
        return cell
    }

    func fetchMovies() {
        Network.share.fetchData { (movies1) in
            DispatchQueue.main.async {
                self.movies = movies1
                self.collectionView.reloadData()
            }
        }
    }
    

}


