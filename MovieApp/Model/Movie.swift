//
//  Movie.swift
//  MovieApp
//
//  Created by Nurzhan on 29.03.2022.
//

import UIKit

class Movie {
    var id: String?
    var title: String?
    var year: String?
    var posterUrl: String?
    
    init(id: String, dictionary:[String: AnyObject]) {
        self.id = id
        if let title = dictionary["title"] as? String {
            self.title = title
        }
        if let year = dictionary["year"] as? String {
            self.year = year
        }
        if let posterUrl = dictionary["posterUrl"] as? String {
            self.posterUrl = posterUrl
        }
    }
}
