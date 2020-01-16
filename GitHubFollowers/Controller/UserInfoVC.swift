//
//  UserInfoVC.swift
//  GitHubFollowers
//
//  Created by Max Nabokow on 1/16/20.
//  Copyright © 2020 Maximilian Nabokow. All rights reserved.
//

import UIKit

class UserInfoVC: UIViewController {
    
    // MARK: - UI Elements
    
    
    
    // MARK: - Properties
    
    var username: String?
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        setupLayout()
        
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(doneButtonTapped))
        navigationItem.rightBarButtonItem = doneButton
        
        guard let username = username else { return }
        
        NetworkManager.shared.getUserInfo(for: username) { [weak self] (result) in
            guard let self = self else { return }
            
            switch result {
                
            case .success(let user):
                print(user)
            case .failure(let error):
                self.presentGFAlertOnMainThread(title: "Something went wrong", message: error.rawValue, buttonTitle: "OK")
                
            }
        }
    }
    
    // MARK: - UI Setup
    
    fileprivate func setupUI() {
        view.backgroundColor = .systemBackground
    }
    
    fileprivate func setupLayout() {
        
    }
    
    // MARK: - Selectors
    
    @objc func doneButtonTapped() {
        dismiss(animated: true)
    }
    
    // MARK: - Helper Functions
    
    
}
