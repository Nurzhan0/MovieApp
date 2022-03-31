//
//  Network.swift
//  MovieApp
//
//  Created by Nurzhan on 29.03.2022.
//

import UIKit

class Network: UIViewController {
    static let share = Network()
    
    var mainUrl = "https://run.mocky.io/v3/6652ad4e-c47a-409f-bf7c-3a74e71f5d5e"

    func fetchData(completion: @escaping ([Movie])->()) {
        var movieArray = [Movie]()
        guard let url = URL(string: mainUrl) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error {
                print("Failure to fetch data: \(error.localizedDescription)")
                return
            }
            
            guard let data = data else { return }
            do {
                guard let movies = try JSONSerialization.jsonObject(with: data, options: []) as? [AnyObject] else {return}
                
                for (key, result) in movies.enumerated() {
                    if let dict = result as? [String:AnyObject] {
                        let movie = Movie(id: key, dictionary: dict)
                        movieArray.append(movie)
                        
                        movieArray.sort { (m1, m2) -> Bool in
                            return m1.id! < m2.id!
                        }
                    }
                    completion(movieArray)
                }
                
            } catch let error{
                print(error.localizedDescription)
            }
        }.resume()
    }
    

    

}
