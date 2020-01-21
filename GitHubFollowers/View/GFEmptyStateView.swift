//
//  GFEmptyStateView.swift
//  GitHubFollowers
//
//  Created by Max Nabokow on 1/16/20.
//  Copyright © 2020 Maximilian Nabokow. All rights reserved.
//

import UIKit

class GFEmptyStateView: UIView {

    // MARK: - UI Elements

    fileprivate let messageLabel: UILabel = {
        let l = GFTitleLabel(textAlignment: .center, fontSize: 24)
        l.numberOfLines = 3
        l.textColor = .secondaryLabel
        return l
    }()

    fileprivate let logoImageView: UIImageView = {
        let iv = UIImageView(image: #imageLiteral(resourceName: "empty-state-logo"))
        return iv
    }()

    // MARK: - Init

    override init(frame: CGRect) {
        super.init(frame: frame)

        setupLayout()
    }

    init(message: String) {
        super.init(frame: .zero)
        messageLabel.text = message
        setupLayout()
    }

    // MARK: - UI Setup

    fileprivate func setupLayout() {
        addSubview(messageLabel)
        messageLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            messageLabel.centerYAnchor.constraint(equalTo: centerYAnchor, constant: -150),
            messageLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 40),
            messageLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -40),
            messageLabel.heightAnchor.constraint(equalToConstant: 200)
        ])

        addSubview(logoImageView)
        logoImageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            logoImageView.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 1.3),
            logoImageView.heightAnchor.constraint(equalTo: logoImageView.widthAnchor),
            logoImageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 170),
            logoImageView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 40)
        ])
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
