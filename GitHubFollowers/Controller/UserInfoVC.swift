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
    let headerView: UIView = {
        let v = UIView()
        return v
    }()
    
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
                DispatchQueue.main.async {
                    self.add(childVC: GFUserInfoHeaderVC(user: user), to: self.headerView)
                }
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
        view.addSubview(headerView)
        headerView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            headerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            headerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            headerView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            headerView.heightAnchor.constraint(equalToConstant: 180)
        ])
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

}
