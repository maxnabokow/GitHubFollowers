//
//  GFUserInfoHeaderVC.swift
//  GitHubFollowers
//
//  Created by Max Nabokow on 2/8/20.
//  Copyright © 2020 Maximilian Nabokow. All rights reserved.
//

import UIKit

class GFUserInfoHeaderVC: UIViewController {
    
    // MARK: - UI Elements
    
    fileprivate let avatarImageView = GFAvatarImageView(frame: .zero)
    fileprivate let usernameLabel = GFTitleLabel(textAlignment: .left, fontSize: 34)
    fileprivate let nameLabel = GFSecondaryTitleLabel(fontSize: 18)
    
    fileprivate let locationImageView = UIImageView()
    
    fileprivate let locationLabel = GFSecondaryTitleLabel(fontSize: 18)
    fileprivate let bioLabel = GFBodyLabel(textAlignment: .left)
    
    // MARK: - Properties
    
    var user: User!
    
    // MARK: Init
    
    init(user: User) {
        super.init(nibName: nil, bundle: nil)
        self.user = user
    }
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        setupLayout()
    }
    
    // MARK: - UI Setup
    
    fileprivate func setupUI() {
        avatarImageView.downloadImage(from: user.avatarUrl)
        usernameLabel.text = user.login
        nameLabel.text = user.name ?? ""
        locationImageView.image = UIImage(systemName: SFSymbols.location)
        locationImageView.tintColor = .secondaryLabel
        locationLabel.text = user.location ?? "No Location available"
        bioLabel.text = user.bio ?? "No Bio available"
        bioLabel.numberOfLines = 3
    }
    
    fileprivate func setupLayout() {
        let padding: CGFloat = 20
        let textImagePadding: CGFloat = 20
        
        view.addSubview(avatarImageView)
        avatarImageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            avatarImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: padding),
            avatarImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            avatarImageView.widthAnchor.constraint(equalToConstant: 90),
            avatarImageView.heightAnchor.constraint(equalToConstant: 90)
        ])
        
        view.addSubview(usernameLabel)
        usernameLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            usernameLabel.topAnchor.constraint(equalTo: avatarImageView.topAnchor),
            usernameLabel.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: textImagePadding),
            usernameLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            usernameLabel.heightAnchor.constraint(equalToConstant: 38)
        ])
        
        view.addSubview(nameLabel)
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            nameLabel.centerYAnchor.constraint(equalTo: avatarImageView.centerYAnchor, constant: 8),
            nameLabel.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: textImagePadding),
            nameLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            nameLabel.heightAnchor.constraint(equalToConstant: 20)
        ])
        
        view.addSubview(locationImageView)
        locationImageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            locationImageView.bottomAnchor.constraint(equalTo: avatarImageView.bottomAnchor),
            locationImageView.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: textImagePadding),
            locationImageView.widthAnchor.constraint(equalToConstant: 20),
            locationImageView.heightAnchor.constraint(equalToConstant: 20)
        ])
        
        view.addSubview(locationLabel)
        locationLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            locationLabel.centerYAnchor.constraint(equalTo: locationImageView.centerYAnchor),
            locationLabel.leadingAnchor.constraint(equalTo: locationImageView.trailingAnchor, constant: 5),
            locationLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            locationLabel.heightAnchor.constraint(equalToConstant: 20)
        ])
        
        view.addSubview(bioLabel)
        bioLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            bioLabel.topAnchor.constraint(equalTo: avatarImageView.bottomAnchor, constant: textImagePadding),
            bioLabel.leadingAnchor.constraint(equalTo: avatarImageView.leadingAnchor),
            bioLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            bioLabel.heightAnchor.constraint(equalToConstant: 60)
        ])
    }
    
    // MARK: - Selectors
    
    
    
    // MARK: - Helper Functions
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
