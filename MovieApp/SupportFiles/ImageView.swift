//
//  ImageView.swift
//  MovieApp
//
//  Created by Nurzhan on 29.03.2022.
//

import UIKit

class ImageView: UIImageView {
        
    func fetchImage(with url: String?) {
        guard let url = url else { return }
        guard let imageURL = url.getUrl() else {
            image = UIImage(named: "picture")
            return
        }
        
//        if let cachedImage = getCachedImage(url: imageURL) {
//            image = cachedImage
//            return
//        }
        
        URLSession.shared.dataTask(with: imageURL) { [weak self] (data, response, error) in
            if let error = error { print(error); return }
            guard let data = data, let response = response else {return}
            guard let responseUrl = response.url else {return}
            
            if responseUrl.absoluteString != url { return }
            DispatchQueue.main.async {
                
                self?.image = UIImage(data: data)
            }
            
            // Save image to cache
            self!.saveImageToCache(data: data, response: response)
        }.resume()
        
        
        
    }
    
    private func saveImageToCache(data: Data, response: URLResponse) {
        guard let responseUrl = response.url else { return }
        let cachedResponse = CachedURLResponse(response: response, data: data)
        URLCache.shared.storeCachedResponse(cachedResponse, for: URLRequest(url: responseUrl))
    }
    
    private func getCachedImage(url: URL) -> UIImage? {
        if let cacheResponse = URLCache.shared.cachedResponse(for: URLRequest(url: url )) {
            return UIImage(data: cacheResponse.data)
        }
        return nil
    }

}

private extension String {
    func getUrl()->URL? {
        guard let url = URL(string: self) else { return nil }
        return url
    }
}
