//
//  FollowerCell.swift
//  GitHubFollowers
//
//  Created by Max Nabokow on 1/10/20.
//  Copyright © 2020 Maximilian Nabokow. All rights reserved.
//

import UIKit

class FollowerCell: UICollectionViewCell {

    // MARK: - UI Elements

    fileprivate let avatarImageView = GFAvatarImageView(frame: .zero)

    fileprivate let usernameLabel = GFTitleLabel(textAlignment: .center, fontSize: 14)

    // MARK: - Properties

    static let reuseId = "FollowerCell"

    // MARK: - Init

    override init(frame: CGRect) {
        super.init(frame: frame)

        setupUI()
        setupLayout()
    }

    func configure(follower: Follower) {
        usernameLabel.text = follower.login
        avatarImageView.downloadImage(from: follower.avatarUrl)
    }

    // MARK: - UI Setup

    fileprivate func setupUI() {

    }

    fileprivate func setupLayout() {

        let padding: CGFloat = 8

        addSubview(avatarImageView)
        avatarImageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            avatarImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: padding),
            avatarImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: padding),
            avatarImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -padding),
            avatarImageView.heightAnchor.constraint(equalTo: avatarImageView.widthAnchor)
        ])

        addSubview(usernameLabel)
        usernameLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            usernameLabel.topAnchor.constraint(equalTo: avatarImageView.bottomAnchor, constant: 12),
            usernameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: padding),
            usernameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -padding),
            usernameLabel.heightAnchor.constraint(equalToConstant: 20)
        ])

    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
