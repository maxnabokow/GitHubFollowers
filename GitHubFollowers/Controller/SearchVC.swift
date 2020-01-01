//
//  SearchVC.swift
//  GitHubFollowers
//
//  Created by Max Nabokow on 12/28/19.
//  Copyright © 2019 Maximilian Nabokow. All rights reserved.
//

import UIKit

class SearchVC: UIViewController {
    
    // MARK: - UI Elements
    
    fileprivate let logoImageView: UIImageView = {
        let iv = UIImageView(image: #imageLiteral(resourceName: "gh-logo"))
        return iv
    }()
    
    fileprivate let usernameTextField = GFTextField()
    
    fileprivate let getFollowersButton = GFButton(backgroundColor: .systemGreen, title: "Get Followers")
    
    // MARK: - Properties
    
    
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        setupLayout()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.isNavigationBarHidden = true
    }
    
    // MARK: - UI Setup
    
    fileprivate func setupUI() {
        view.backgroundColor = .systemBackground
    }
    
    fileprivate func setupLayout() {
        view.addSubview(logoImageView)
        logoImageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            logoImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 80),
            logoImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            logoImageView.widthAnchor.constraint(equalToConstant: 200),
            logoImageView.heightAnchor.constraint(equalToConstant: 200)
        ])
        
        view.addSubview(usernameTextField)
        usernameTextField.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            usernameTextField.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: 48),
            usernameTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            usernameTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            usernameTextField.heightAnchor.constraint(equalToConstant: 50)
        ])
        
        view.addSubview(getFollowersButton)
        getFollowersButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            getFollowersButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            getFollowersButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -50),
            getFollowersButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            getFollowersButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    // MARK: - Selectors
    
    
    
    // MARK: - Helper Functions
    
    
}
