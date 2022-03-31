//
//  MovieCollectionViewCell.swift
//  MovieApp
//
//  Created by Nurzhan on 29.03.2022.
//

import UIKit

class MovieCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet var movieImageView: ImageView!
    @IBOutlet var titleLabel: UILabel!
    
    func configure(with movie: Movie, indx: IndexPath) {
        self.titleLabel.text = movie.title
        self.movieImageView.fetchImage(with: movie.posterUrl)
    }
    
}
