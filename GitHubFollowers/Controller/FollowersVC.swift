//
//  FollowersVC.swift
//  GitHubFollowers
//
//  Created by Max Nabokow on 1/1/20.
//  Copyright © 2020 Maximilian Nabokow. All rights reserved.
//

import UIKit

class FollowersVC: UIViewController {
    
    // MARK: - UI Elements
    
    
    
    // MARK: - Properties
    
    var username: String?
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        setupLayout()
        
        guard let username = username else { return }
        
        NetworkManager.shared.getFollowers(for: username, pageNr: 1) { (result) in
            switch result {
                
            case .success(let followers):
                print(followers)
            case.failure(let error):
                self.presentGFAlertOnMainThread(title: "Bad Stuff Happened", message: error.rawValue, buttonTitle: "OK")
            }
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    // MARK: - UI Setup
    
    fileprivate func setupUI() {
        view.backgroundColor = .systemBackground
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    fileprivate func setupLayout() {
        
    }
    
    // MARK: - Selectors
    
    
    
    // MARK: - Helper Functions
    
    
}
