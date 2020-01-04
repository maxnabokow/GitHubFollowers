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
        NetworkManager.shared.getFollowers(for: username, pageNr: 1) { [unowned self] (followers, errorMessage) in
            guard let followers = followers else {
                self.presentGFAlertOnMainThread(title: "Bad stuff happened.", message: errorMessage!.rawValue, buttonTitle: "OK")
                return
            }
            
            print("Followers.count = \(followers.count)")
            print(followers)
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
