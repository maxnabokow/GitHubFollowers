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
    fileprivate let headerView = UIView()
    fileprivate let itemView1 = UIView()
    fileprivate let itemView2 = UIView()
    
    fileprivate var itemViews: [UIView] = []
    
    // MARK: - Properties

    var username: String?

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
        setupLayout()
        setupDoneButton()
        getUserInfo()
    }

    // MARK: - UI Setup

    fileprivate func setupUI() {
        view.backgroundColor = .systemBackground
        
        itemView1.backgroundColor = .systemPink
        itemView2.backgroundColor = .systemBlue
    }

    fileprivate func setupLayout() {
        
        itemViews = [headerView, itemView1, itemView2]
        
        let padding: CGFloat = 20
        let itemHeight: CGFloat = 140
        
        for itemView in itemViews {
            view.addSubview(itemView)
            itemView.translatesAutoresizingMaskIntoConstraints = false
            
            NSLayoutConstraint.activate([
                itemView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding),
                itemView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding)
            ])
        }
        
        NSLayoutConstraint.activate([
            headerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            headerView.heightAnchor.constraint(equalToConstant: 180),

            itemView1.topAnchor.constraint(equalTo: headerView.bottomAnchor, constant: padding),
            itemView1.heightAnchor.constraint(equalToConstant: itemHeight),

            itemView2.topAnchor.constraint(equalTo: itemView1.bottomAnchor, constant: padding),
            itemView2.heightAnchor.constraint(equalToConstant: itemHeight)
        ])
    }
    
    fileprivate func setupDoneButton() {
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(doneButtonTapped))
        navigationItem.rightBarButtonItem = doneButton
    }
    
    fileprivate func add(childVC: UIViewController, to containerView: UIView) {
        addChild(childVC)
        containerView.addSubview(childVC.view)
        childVC.view.frame = containerView.bounds
    }

    // MARK: - Selectors

    @objc func doneButtonTapped() {
        dismiss(animated: true)
    }

    // MARK: - Helper Functions
    fileprivate func getUserInfo() {
        guard let username = username else { return }

        NetworkManager.shared.getUserInfo(for: username) { [weak self] (result) in
            guard let self = self else { return }

            switch result {

            case .success(let user):
                DispatchQueue.main.async {
                    self.add(childVC: GFUserInfoHeaderVC(user: user), to: self.headerView)
                }
            case .failure(let error):
                self.presentGFAlertOnMainThread(title: "Something went wrong", message: error.rawValue, buttonTitle: "OK")

            }
        }
    }
}
