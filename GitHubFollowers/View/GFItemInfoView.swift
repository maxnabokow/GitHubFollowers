//
//  GFItemInfoView.swift
//  GitHubFollowers
//
//  Created by Max Nabokow on 2/8/20.
//  Copyright © 2020 Maximilian Nabokow. All rights reserved.
//

import UIKit

enum ItemInfoType {
    case repos, gists, followers, following
}

class GFItemInfoView: UIView {
    
    fileprivate let symbolImageView = UIImageView()
    fileprivate let titleLabel = GFTitleLabel(textAlignment: .left, fontSize: 14)
    fileprivate let countLabel = GFTitleLabel(textAlignment: .center, fontSize: 14)
    
    
    // MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupUI()
        setupLayout()
    }
    
    // MARK: - UI Setup
    
    fileprivate func setupUI() {
        symbolImageView.contentMode = .scaleAspectFill
        symbolImageView.tintColor = .label
    }
    
    fileprivate func setupLayout() {
        addSubview(symbolImageView)
        symbolImageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            symbolImageView.topAnchor.constraint(equalTo: topAnchor),
            symbolImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            symbolImageView.widthAnchor.constraint(equalToConstant: 20),
            symbolImageView.heightAnchor.constraint(equalToConstant: 20)
        ])
        
        addSubview(titleLabel)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            titleLabel.centerYAnchor.constraint(equalTo: symbolImageView.centerYAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: symbolImageView.trailingAnchor, constant: 12),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            titleLabel.heightAnchor.constraint(equalToConstant: 18)
        ])
        
        addSubview(countLabel)
        countLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            countLabel.topAnchor.constraint(equalTo: symbolImageView.bottomAnchor, constant: 4),
            countLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            countLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            countLabel.heightAnchor.constraint(equalToConstant: 18)
        ])
    }
    
    func set(itemInfoType: ItemInfoType, withCount count: Int) {
        switch itemInfoType {
        case .repos:
            symbolImageView.image = UIImage(systemName: SFSymbols.repos)
            titleLabel.text = "Public Repos"
        case .gists:
            symbolImageView.image = UIImage(systemName: SFSymbols.gists)
            titleLabel.text = "Public Gists"
        case .followers:
            symbolImageView.image = UIImage(systemName: SFSymbols.followers)
            titleLabel.text = "Followers"
        case .following:
            symbolImageView.image = UIImage(systemName: SFSymbols.following)
            titleLabel.text = "Following"
        }
        
        countLabel.text = String(count)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
