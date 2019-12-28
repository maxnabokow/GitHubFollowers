//
//  SearchVC.swift
//  GitHubFollowers
//
//  Created by Max Nabokow on 12/28/19.
//  Copyright © 2019 Maximilian Nabokow. All rights reserved.
//

import UIKit
import LBTATools

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
        usernameTextField.anchor(top: logoImageView.bottomAnchor, leading: view.leadingAnchor, bottom: nil, trailing: view.trailingAnchor, padding: .init(top: 48, left: 50, bottom: 0, right: 50))
        usernameTextField.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        view.addSubview(getFollowersButton)
        getFollowersButton.anchor(top: nil, leading: view.leadingAnchor, bottom: view.bottomAnchor, trailing: view.trailingAnchor, padding: .init(top: 0, left: 50, bottom: 50, right: 50))
        getFollowersButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
    
    // MARK: - Selectors
    
    
    
    // MARK: - Helper Functions
    
    
}
