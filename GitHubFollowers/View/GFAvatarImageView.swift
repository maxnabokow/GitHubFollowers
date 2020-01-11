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
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
