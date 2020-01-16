//
//  GFAvatarImageView.swift
//  GitHubFollowers
//
//  Created by Max Nabokow on 1/10/20.
//  Copyright © 2020 Maximilian Nabokow. All rights reserved.
//

import UIKit

class GFAvatarImageView: UIImageView {
    
    fileprivate let placeholderImage = #imageLiteral(resourceName: "avatar-placeholder")
    let cache = NetworkManager.shared.cache

    // MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupUI()
    }
    
    
    // MARK: - UI Setup
    
    fileprivate func setupUI() {
        layer.cornerRadius = 10
        clipsToBounds = true
        image = placeholderImage
    }
    
    // MARK: - Helper Functions
    
    func downloadImage(from urlString: String) {
        
        let cacheKey = NSString(string: urlString)
        
        if let image = cache.object(forKey: cacheKey) {
            self.image = image
            return
        }
        
        guard let url = URL(string: urlString) else { return }
        
        URLSession.shared.dataTask(with: url) { [weak self] (data, response, error) in
            guard let self = self else { return }
            
            if error != nil { return }
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else { return }
            guard let data = data else { return }
            
            guard let image = UIImage(data: data) else { return }
            
            self.cache.setObject(image, forKey: cacheKey)
            
            DispatchQueue.main.async {
                self.image = image
            }
            
        }.resume()
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
